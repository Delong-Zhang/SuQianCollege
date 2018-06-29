using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.IO;

namespace FTP
{
    public partial class Form1 : Form
    {
        string changeDir;  //更换的目录名
        public Form1()
        {
            InitializeComponent();
            txtFtpUri.Text = "ftp://delongzhang.cn";
            txtPort.Text = "21";
            txtName.Text = "User_20180701";
            txtPwd.Text = "User_20180701";
        }

        private void GetFileList(Stream stream)//把FTP服务器返回的文件列表填充到ListBox控件中。
        {
            Encoding encodingGB2312 = System.Text.Encoding.GetEncoding("GB2312");//获取一个能够使用GB2312进行编码/解码的Encoding的对象

            StreamReader strReader = new StreamReader(stream, encodingGB2312);//用指定的编码和指定的流初始化StreamReader对象
            string content = strReader.ReadToEnd();
            string[] files = content.Split('\n');
            listBox1.DataSource = files;
            strReader.Close();

        }

        private void btnConnection_Click(object sender, EventArgs e)
        {
            Cursor currentCursor = this.Cursor;//保存当前鼠标指针显示的光标
            FtpWebResponse respones = null;
            Stream stream = null;
            try
            {
                this.Cursor = Cursors.WaitCursor;//指针显示的光标改变为等待光标
                string ftp = txtFtpUri.Text + ":" + txtPort.Text;
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp);//创建WebRequest实例
                request.Credentials = new NetworkCredential(txtName.Text, txtPwd.Text);//设置与FTP服务器通信的凭证
                request.Method = WebRequestMethods.Ftp.ListDirectory;//设置要发送到FTP服务器的命令是获取文件列表
                respones = (FtpWebResponse)request.GetResponse();//返回服务器的响应
                stream = respones.GetResponseStream();//获取包含从FTP服务器上发送的响应数据的流
                GetFileList(stream);////把FTP服务器返回的文件列表填充到ListBox控件中
                changeDir = string.Empty; ;


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (respones != null) respones.Close();
                if (stream != null) stream.Close();
                this.Cursor = currentCursor;//恢复鼠标指针显示的光标

            }
        }

        private void btnDownLoad_Click(object sender, EventArgs e)
        {
            Cursor currentCursor = this.Cursor;//保存当前鼠标指针显示的光标
            FtpWebResponse respones = null;
            Stream inStream = null;
            Stream outStream = null;

            try
            {
                this.Cursor = Cursors.WaitCursor;//指针显示的光标改变为等待光标
                string ftp = txtFtpUri.Text + ":" + txtPort.Text;
                Uri baseUri = new Uri(ftp);
                string fileName = listBox1.SelectedItem.ToString().Trim(); ;
                string fullName = changeDir + "/" + fileName;
                Uri uri = new Uri(baseUri, fullName);

                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(uri);//创建WebRequest实例
                request.Credentials = new NetworkCredential(txtName.Text, txtPwd.Text);//设置与FTP服务器通信的凭证
                request.Method = WebRequestMethods.Ftp.DownloadFile;//设置要发送到FTP服务器的命令是下载文件
                respones = (FtpWebResponse)request.GetResponse();//返回服务器的响应
                inStream = respones.GetResponseStream();//获取包含从FTP服务器上发送的响应数据的流
                saveFileDialog1.FileName = fileName;
                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    outStream = File.OpenWrite(saveFileDialog1.FileName);//打开文件以便写入文件
                    byte[] buffer = new byte[1024];
                    int size = 0;
                    while ((size = inStream.Read(buffer, 0, 1024)) > 0) //每次读取1024个字节并写入
                    {
                        outStream.Write(buffer, 0, size);
                    }
                    MessageBox.Show(String.Format("文件{0}\n下载成功！", saveFileDialog1.FileName), "成功", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (respones != null) respones.Close();
                if (inStream != null) inStream.Close();
                if (outStream != null) outStream.Close();
                this.Cursor = currentCursor;

            }
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            Cursor currentCursor = this.Cursor;//保存当前鼠标指针显示的光标
            FtpWebResponse respones = null;
            Stream inStream = null;
            Stream outStream = null;

            try
            {


                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    this.Cursor = Cursors.WaitCursor;//指针显示的光标改变为等待光标
                    string ftp = txtFtpUri.Text + ":" + txtPort.Text;
                    Uri baseUri = new Uri(ftp);
                    string fileName = openFileDialog1.FileName;
                    string fullName = changeDir + "/" + fileName.Substring(fileName.LastIndexOf('\\') + 1);
                    Uri uri = new Uri(baseUri, fullName);

                    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(uri);//创建WebRequest实例
                    request.Credentials = new NetworkCredential(txtName.Text, txtPwd.Text);//设置与FTP服务器通信的凭证
                    request.Method = WebRequestMethods.Ftp.UploadFile;//设置要发送到FTP服务器的命令是下载文件
                    outStream = request.GetRequestStream();
                    //respones = (FtpWebResponse)request.GetResponse();//返回服务器的响应
                    //outStream = respones.GetResponseStream();//获取包含从FTP服务器上发送的响应数据的流
                    inStream = File.OpenRead(openFileDialog1.FileName);//打开文件以便写入文件
                    byte[] buffer = new byte[1024];
                    int size = 0;
                    while ((size = inStream.Read(buffer, 0, 1024)) > 0) //每次读取1024个字节并写入
                    {
                        outStream.Write(buffer, 0, size);
                    }
                    MessageBox.Show(String.Format("文件{0}\n上传成功！", fileName), "成功", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (respones != null) respones.Close();
                if (inStream != null) inStream.Close();
                if (outStream != null) outStream.Close();
                this.Cursor = currentCursor;

            }
        }

        private void btnChangDir_Click(object sender, EventArgs e)
        {
            Cursor currentCursor = this.Cursor;
            FtpWebResponse respones = null;
            Stream stream = null;
            try
            {
                this.Cursor = Cursors.WaitCursor;
                string subDir = listBox1.SelectedItem.ToString().Trim();
                changeDir += "/" + subDir;
                string ftp = txtFtpUri.Text + ":" + txtPort.Text;
                Uri baseUri = new Uri(ftp);
                Uri uri = new Uri(baseUri, changeDir);

                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(uri);
                request.Credentials = new NetworkCredential(txtName.Text, txtPwd.Text);
                request.Method = WebRequestMethods.Ftp.ListDirectory;
                respones = (FtpWebResponse)request.GetResponse();
                stream = respones.GetResponseStream();
                GetFileList(stream);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (respones != null) respones.Close();
                if (stream != null) stream.Close();
                this.Cursor = currentCursor;

            }
        }
    }
}
