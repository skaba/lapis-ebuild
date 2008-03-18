/*
 * Main.java
 *
 * Created on March 17, 2008, 10:32 AM
 *
 ****************************************************************************
 *                                                                          *
 *    Copyright (C) 2008 by Serkan Kaba <serkan_kaba@yahoo.com>             *
 *    Based on jpaste by Kenneth Prugh <ken69267@gmail.com>                 *
 *                                                                          *
 *    This program is free software; you can redistribute it and*or modify  *
 *    it under the terms of the GNU General Public License as published by  *
 *    the Free Software Foundation under version 2 of the license.          *
 *                                                                          *
 *    This program is distributed in the hope that it will be useful,       *
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *    GNU General Public License for more details.                          *
 *                                                                          *
 *    You should have received a copy of the GNU General Public License     *
 *    along with this program; if not, write to the                         *
 *    Free Software Foundation, Inc.,                                       *
 *    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ****************************************************************************
 */

package lapispaste;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.PosixParser;

public class Main {

    private static void paster(Map<String, String> pastemap, StringBuffer pdata) {
	try {
	    URL url = new URL("http://paste.linux-sevenler.org/index.php");
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	    // set connection 'writeable'
	    conn.setDoOutput(true);
	    conn.setDoInput(true);
	    conn.setRequestMethod("POST");

	    // construct the data...
	    String data;
	    String pdataString = pdata.toString();
	    data = URLEncoder.encode("language", "ISO-8859-9") + "="
		    + URLEncoder.encode(pastemap.get("format"), "ISO-8859-9");
	    data += "&" + URLEncoder.encode("source", "ISO-8859-9") + "="
		    + URLEncoder.encode(pdataString, "ISO-8859-9");
	    data += "&" + URLEncoder.encode("submit", "ISO-8859-9") + "="
		    + URLEncoder.encode(" Kaydet ", "ISO-8859-9");

	    OutputStreamWriter wr = new OutputStreamWriter(conn
		    .getOutputStream());
	    wr.write(data);
	    wr.flush();

	    // get new url where the paste is
	    conn.getInputStream();
	    System.out.println(conn.getURL());
	    conn.disconnect();
	} catch (IOException ex) {
	    ex.printStackTrace();
	}
    }

    private static StringBuffer readData(Reader in) {
	try {
	    BufferedReader read = new BufferedReader(in);
	    StringBuffer content = new StringBuffer();
	    String line = null;
	    while ((line = read.readLine()) != null) {
		content.append(line);
		content.append("\n");
	    }
	    return content;
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    return null;
	}
    }

    public static void main(String[] args) throws Exception {
	// create Options object
	Options options = new Options();
	String version;

	version = "0.1";

	// populate Options with.. well options :P
	options.addOption("v", false, "Display version");
	options.addOption("f", true, "File to paste");

	// non-critical options
	options.addOption("t", true, "Code language");
	options.addOption("p", false, "Read from pipe");

	CommandLineParser parser = new PosixParser();
	CommandLine cmd = parser.parse(options, args);

	// assemble a map of values
	final Map<String, String> pastemap = new HashMap<String, String>();

	if (cmd.hasOption("t"))
	    pastemap.put("format", cmd.getOptionValue("t").toString());
	else
	    pastemap.put("format", "text");

	// critical options
	if (cmd.hasOption("v"))
	    System.out.println("lapispaste version " + version);
	else if (cmd.hasOption("f")) {
	    File file = new File(cmd.getOptionValue("f"));
	    StringBuffer pdata = readData(new FileReader(file));
	    paster(pastemap, pdata);
	} else if (cmd.hasOption("p")) {
	    StringBuffer pdata = readData(new InputStreamReader(System.in));
	    paster(pastemap, pdata);
	} else {
	    // Did not recieve what was expected
	    HelpFormatter formatter = new HelpFormatter();
	    formatter.printHelp("lapispaste [OPTIONS] [FILE]", options);
	}

    }

}
