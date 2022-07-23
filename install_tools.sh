INSTLL_CMD="brew install"
clitools=(exa fzf zoxide)
for appname in ${clitools[@]}; do
    ($INSTLL_CMD $appname)
done
