Just my own .bashrc.

# Setup

### Download and install

    git clone https://github.com/agrahamlincoln/bashrc.git ~/bashrc; echo -e "\nsource ~/bashrc/init.sh\n" >> ~/.bashrc; source ~/.bashrc 

### On Mac OS
`.bashrc` needs to be added to the `.profile` file in Mac OS. This is because OS X does not read `.bashrc` on start. Instead it reads the following (in order):
1.  /etc/profile
2.  ~/.bash_profile
3.  ~/.bash_login
4.  ~/.profile

Execute the following to add to `.profile`

    echo "source ~/.bashrc" >> .profile

### VirtualEnvWrapper

This includes the shell startup lines for python virtualenvwrapper. You can read more about virtualenvwrapper here: http://virtualenvwrapper.readthedocs.io/en/latest/install.html
 
