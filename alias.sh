# fix of : "SignatureDoesNotMatch: Signature expired is now earlier than...."
alias fix-date="sudo date -s \"$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z\""
