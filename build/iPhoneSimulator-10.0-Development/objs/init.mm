#import <Foundation/Foundation.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
    void ruby_init_device_repl(void);
void MREP_38E837C85133455896654F67DE410E53(void *, void *);
void MREP_912E5298BE43437DBFAA08888F671120(void *, void *);
void MREP_C1D05B41ECD3427EB0BBCE3CC8F6327B(void *, void *);
int rm_repl_port = 53363;
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
ruby_init_device_repl();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"4.14");
MREP_38E837C85133455896654F67DE410E53(self, 0);
MREP_912E5298BE43437DBFAA08888F671120(self, 0);
MREP_C1D05B41ECD3427EB0BBCE3CC8F6327B(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
