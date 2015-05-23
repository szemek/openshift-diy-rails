openshift-diy-rails
===================

Ruby 1.9.3, Rails 3.2.6 on OpenShift platform


Installation
-------------------

1.  [Create Do-It-Yourself application](https://openshift.redhat.com/app/console/application_types)
2.  Log into a remote machine (check [instruction](https://developers.openshift.com/en/managing-remote-connection.html))
3.  Execute  
`cd $OPENSHIFT_TMP_DIR`  
`wget https://raw.githubusercontent.com/szemek/openshift-diy-rails/master/install.sh`  
`chmod u+x install.sh`  
`./install.sh`
4.  Wait until installation is finished. It should take circa 15-20 minutes.
5.  Clone locally repository: `git clone https://github.com/szemek/openshift-diy-rails.git`
6.  Feel free to modify code, set up remote repository & push your code to OpenShift platform.
7.  Have fun :-)
