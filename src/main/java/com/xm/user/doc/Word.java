package com.xm.user.doc;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xm on 2017/2/24.
 */
public class Word {
    public static void main(String[] args) {
        try {
            // --获取指定目录下，所有excel文件名
            List fileNameList = new ArrayList();
            String dirName = "f://vbs";
            File dir = new File(dirName);
            File[] files = dir.listFiles();
            if (files == null)
            {
                System.out.println("当前目录没有文件");
                return;
            }
            for (int i = 0; i < files.length; i++) {
                if (!files[i].isDirectory()) {
                    String strFileName = files[i].getName();
                    if(strFileName.endsWith("xls"))
                    {
                        //System.out.println(strFileName);
                        fileNameList.add(strFileName);
                    }
                }
            }
            //--动态生成VBS文件。然后调用这些VBS文件，打开并保存excel文件
            if(fileNameList.size()>0)
            {
                for(int i=0;i<fileNameList.size();i++)
                {
                    String excelname = fileNameList.get(i).toString();
                    String FileName = dirName+"//vbs"+i+".vbs";
                    File vbsFile = new File(FileName);
                    if(vbsFile.exists()){
                        vbsFile.delete();
                        //System.out.println("删除："+FileName);
                    }
                    vbsFile.createNewFile();
                    //--写入vbs内容
                    String excelPath = dirName+"//"+excelname;
                    writerLine(FileName,"Set objExcel = CreateObject(\"Excel.Application\")");
                    writerLine(FileName," objExcel.Visible = True ");
                    writerLine(FileName,"Set objWorkbook = objExcel.Workbooks.Open (\""+excelPath+"\")");
                    //writerLine(FileName,"objExcel.Cells(1,1).Value = /"123/"");
                    writerLine(FileName,"objExcel.Workbooks(1).Save '保存工作表' ");
                    writerLine(FileName,"objExcel.Workbooks(1).Close '关闭工作表' ");
                    writerLine(FileName,"objExcel.Quit  '退出'  ");
                    //--执行生成的脚本
                    FileName ="F:\\vbs\\vbs1.vbs";
                    String[] cpCmd  = new String[]{"wscript", FileName};
                    Process process = Runtime.getRuntime().exec(cpCmd);
                    // wait for the process end
                    int val = process.waitFor();//val 是返回值
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void writerLine(String path, String contents) {
        try {
            FileWriter fileWriter = new FileWriter(path, true);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            bufferedWriter.write(contents);
            bufferedWriter.newLine();
            bufferedWriter.flush();
            bufferedWriter.close();
            fileWriter.close();
        } catch (IOException ioe) {
        }
    }
}
