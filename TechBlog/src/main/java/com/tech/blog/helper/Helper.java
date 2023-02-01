package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.eclipse.jdt.internal.compiler.env.IModule.IService;

public class Helper {
	public static Boolean deleteFile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public static Boolean saveFile(InputStream io, String path) {
		boolean f = false;
		try {
			byte b[] = new byte[io.available()];
			io.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

}
