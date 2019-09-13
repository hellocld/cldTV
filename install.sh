#!/bin/bash

# Sets up cldTV

echo "*** Installing cldTV ***"

echo "Installing youtube-dl..."
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "Copying scripts..."
cp cldTVCleanup.sh ~/
cp cldTVUpdate.sh ~/
cp cldTV.sh ~/

echo "Creating Video directory..."
mkdir ~/Video

echo "Configuring systemd units..."
cp cldTVCleanup.service /etc/systemd/system/
cp cldTVUpdate.service /etc/systemd/system/
cp cldTVUpdate.timer /etc/systemd/system/

systemctl daemon-reload

systemctl enable cldTVUpdate.timer
systemctl start cldTVUpdate.timer

systemctl enable cldTVCleanup.service
systemctl start cldTVCleanup.service

echo "Adding cldTV to .bashrc..."
echo "# Launch cldTV" >> ~/.bashrc
echo "~/cldTV.sh" >> ~/.bashrc

echo "Installation complete. Restart your system to launch cldTV."
