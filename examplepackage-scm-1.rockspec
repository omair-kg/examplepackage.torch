package = "tukeyLoss"
version = "scm-1"

source = {
   url = "https://github.com/omair-kg/examplepackage.torch",
   tag = "master"
}

description = {
   summary = "Tukey Loss function for regression tasks",
   detailed = [[
   	    Based on the paper 'Robust Optimization for deep regression' by Belagiannis et al.
   ]],
   homepage = "https://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0ahUKEwiVkviukbPTAhUFxRQKHURyDDMQFggxMAE&url=http%3A%2F%2Fwww.cv-foundation.org%2Fopenaccess%2Fcontent_iccv_2015%2Fpapers%2FBelagiannis_Robust_Optimization_for_ICCV_2015_paper.pdf&usg=AFQjCNFx1600kvb23M-Ahu-W4LS_01z7nw&sig2=2fg_71_aWkNnB4R0j8Mjww"
}

dependencies = {
   "torch >= 7.0"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)"; 
$(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
