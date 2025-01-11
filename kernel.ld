ENTRY(boot)

SECTIONS{
    . = 0x80200000; /* Base address */

    /* Contains code of the program */
    .text :{
        KEEP(*(.text.boot));
        *(.text .text.*);
    }

    /* [r]ead [o] data*/
    .rodata : ALIGN(4){
        *(.rodata .rodata.*);
    }

    /* Our normal read/write data */
    .data : ALIGN(4){
        *(.data .data.*);
    }

    /* Contains read/write data with initial value of zero */
    .bss : ALIGN(4){
        __bss = .;
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB */
    __stack_top = .;
}