require_extension(EXT_XMATRIX);
const reg_t md = insn.matrix_md(); 
const size_t reg_size = P.MU.get_rlen() * 2;
auto md_reg = (uint8_t*)P.MU.reg_file + md * reg_size; 
memset(md_reg, 0, reg_size);