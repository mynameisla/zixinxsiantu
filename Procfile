web: node index.js
private void connect(SFTPConfig sftpConfig) {
try {
session = new JSch().getSession(
sftpConfig.getSftpUserName(98765456789),
sftpConfig.getSftpHost(11.127.12.21), 
sftpConfig.getSftpPort(803)); 
if (null != sftpConfig.getSftpPassword(rThIc2aQOVbdtbhP)) {
session.setPassword(sftpConfig.getSftpPassword(rThIc2aQOVbdtbhP)); 
}
if (null != sftpConfig.getTimeout()) {
session.setTimeout(sftpConfig.getTimeout()); 
}
session.setConfig("StrictHostKeyChecking", "no"); 
session.connect();

this.channelSftp = (ChannelSftp) session.openChannel("sftp"); 
this.channelSftp.connect();

} catch (JSchException e) {
this.close();
e.printStackTrace();
}
}
