	.file	"tracer.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"byte_offset:%llx\n"
.LC1:
	.string	"errno: %s\n"
.LC2:
	.string	"PEEKDATA: %llx \n"
	.text
	.globl	print_peek_data
	.type	print_peek_data, @function
print_peek_data:
.LFB6:
	.file 1 "util.c"
	.loc 1 13 67
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 14 3
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 16 17
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %esi
	movl	$2, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -24(%rbp)
	.loc 1 17 25
	cmpq	$-1, -24(%rbp)
	sete	%bl
	.loc 1 17 28
	call	__errno_location@PLT
	.loc 1 17 27
	movl	(%rax), %eax
	.loc 1 17 25
	testl	%eax, %eax
	setne	%al
	andl	%ebx, %eax
	.loc 1 17 6
	testb	%al, %al
	je	.L2
	.loc 1 18 37
	call	__errno_location@PLT
	.loc 1 18 5
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	.loc 1 20 3
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 21 1
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_peek_data, .-print_peek_data
	.section	.rodata
.LC3:
	.string	"peekdata hexaddr: "
.LC4:
	.string	"%llx"
	.text
	.globl	print_peek_data_interactively
	.type	print_peek_data_interactively, @function
print_peek_data_interactively:
.LFB7:
	.loc 1 23 54
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 23 54
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 25 3
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 26 3
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 27 3
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	print_peek_data
	.loc 1 28 1
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	print_peek_data_interactively, .-print_peek_data_interactively
	.section	.rodata
	.align 8
.LC5:
	.string	"  poke_data called pid:%d, offset:%lld, word:%llx\n"
.LC6:
	.string	"  word:%llx\n"
	.text
	.globl	poke_data
	.type	poke_data, @function
poke_data:
.LFB8:
	.loc 1 30 81
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 32 3
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 33 3
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 34 19
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$5, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -24(%rbp)
	.loc 1 35 29
	cmpq	$-1, -24(%rbp)
	sete	%bl
	.loc 1 35 32
	call	__errno_location@PLT
	.loc 1 35 31
	movl	(%rax), %eax
	.loc 1 35 29
	testl	%eax, %eax
	setne	%al
	andl	%ebx, %eax
	.loc 1 35 8
	testb	%al, %al
	je	.L7
	.loc 1 36 37
	call	__errno_location@PLT
	.loc 1 36 5
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	.loc 1 38 1
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	poke_data, .-poke_data
	.section	.rodata
.LC7:
	.string	"poke hexaddr: "
.LC8:
	.string	"hexword:"
	.text
	.globl	poke_data_interactively
	.type	poke_data_interactively, @function
poke_data_interactively:
.LFB9:
	.loc 1 40 48
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	.loc 1 40 48
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 43 3
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 44 3
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 45 3
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 46 3
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	.loc 1 47 3
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	poke_data
	.loc 1 49 1
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	poke_data_interactively, .-poke_data_interactively
	.section	.rodata
.LC9:
	.string	"general purpose registers"
.LC10:
	.string	"r15:     %16llx %30s\n"
.LC11:
	.string	"r14:     %16llx\n"
.LC12:
	.string	"r13:     %16llx\n"
.LC13:
	.string	"r12:     %16llx\n"
.LC14:
	.string	"rbp:     %16llx\n"
.LC15:
	.string	"rbx:     %16llx\n"
.LC16:
	.string	"r11:     %16llx\n"
.LC17:
	.string	"r10:     %16llx\n"
.LC18:
	.string	"6."
.LC19:
	.string	"r9:      %16llx   %s\n"
.LC20:
	.string	"5."
.LC21:
	.string	"r8:      %16llx   %s\n"
.LC22:
	.string	"rax:     %16llx\n"
.LC23:
	.string	"4."
.LC24:
	.string	"rcx:     %16llx   %s\n"
.LC25:
	.string	"3."
.LC26:
	.string	"rdx:     %16llx   %s\n"
.LC27:
	.string	"2."
.LC28:
	.string	"rsi:     %16llx   %s\n"
.LC29:
	.string	"1. function/syscall argument"
.LC30:
	.string	"rdi:     %16llx %30s\n"
.LC31:
	.string	"orig_rax:%16llx\n"
.LC32:
	.string	"instruction pointer"
.LC33:
	.string	"rip:     %16llx %30s\n"
.LC34:
	.string	"cs:      %16llx\n"
.LC35:
	.string	"eflags:  %16llx\n"
	.align 8
.LC36:
	.string	"  Stack Pointer (current location in stack)"
.LC37:
	.string	"rsp:     %16llx %30s\n"
.LC38:
	.string	"ss:      %16llx\n"
.LC39:
	.string	"fs_base: %16llx\n"
.LC40:
	.string	"gs_base: %16llx\n"
.LC41:
	.string	"ds:      %16llx\n"
.LC42:
	.string	"es:      %16llx\n"
.LC43:
	.string	"fs:      %16llx\n"
.LC44:
	.string	"gs:      %16llx\n"
	.text
	.globl	print_user_regs_struct
	.type	print_user_regs_struct, @function
print_user_regs_struct:
.LFB10:
	.loc 1 51 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 52 3
	movq	16(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 53 3
	movq	24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 54 3
	movq	32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 55 3
	movq	40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 56 3
	movq	48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 57 3
	movq	56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 58 3
	movq	64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 59 3
	movq	72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 60 3
	movq	80(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 61 3
	movq	88(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 62 3
	movq	96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 63 3
	movq	104(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 64 3
	movq	112(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 65 3
	movq	120(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 66 3
	movq	128(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 67 3
	movq	136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 68 3
	movq	144(%rbp), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 69 3
	movq	152(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 70 3
	movq	160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 71 3
	movq	168(%rbp), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 72 3
	movq	176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 73 3
	movq	184(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 74 3
	movq	192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 75 3
	movq	200(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 76 3
	movq	208(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 77 3
	movq	216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 78 3
	movq	224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 79 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	print_user_regs_struct, .-print_user_regs_struct
	.section	.rodata
	.align 8
.LC45:
	.string	"(q)uit, next (s)tep, (p)eek data, (P)oke data, print (r)egisters  "
	.text
	.globl	peekpoke_interactively
	.type	peekpoke_interactively, @function
peekpoke_interactively:
.LFB11:
	.loc 1 81 76
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 82 3
	leaq	.LC45(%rip), %rdi
	call	puts@PLT
	.loc 1 84 9
	jmp	.L12
.L16:
	.loc 1 85 18
	call	getchar@PLT
	.loc 1 85 16
	movb	%al, -1(%rbp)
	.loc 1 86 7
	cmpb	$10, -1(%rbp)
	je	.L19
	.loc 1 87 7
	movsbl	-1(%rbp), %eax
	cmpl	$114, %eax
	je	.L13
	cmpl	$114, %eax
	jg	.L12
	cmpl	$80, %eax
	je	.L14
	cmpl	$112, %eax
	jne	.L12
	.loc 1 88 18
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	print_peek_data_interactively
	.loc 1 88 7
	jmp	.L12
.L14:
	.loc 1 89 18
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	poke_data_interactively
	.loc 1 89 7
	jmp	.L12
.L13:
	.loc 1 90 18
	subq	$8, %rsp
	pushq	224(%rbp)
	pushq	216(%rbp)
	pushq	208(%rbp)
	pushq	200(%rbp)
	pushq	192(%rbp)
	pushq	184(%rbp)
	pushq	176(%rbp)
	pushq	168(%rbp)
	pushq	160(%rbp)
	pushq	152(%rbp)
	pushq	144(%rbp)
	pushq	136(%rbp)
	pushq	128(%rbp)
	pushq	120(%rbp)
	pushq	112(%rbp)
	pushq	104(%rbp)
	pushq	96(%rbp)
	pushq	88(%rbp)
	pushq	80(%rbp)
	pushq	72(%rbp)
	pushq	64(%rbp)
	pushq	56(%rbp)
	pushq	48(%rbp)
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	call	print_user_regs_struct
	addq	$224, %rsp
	.loc 1 90 7
	jmp	.L12
.L19:
	.loc 1 92 5
	nop
.L12:
	.loc 1 84 9
	cmpb	$115, -1(%rbp)
	je	.L15
	.loc 1 84 28 discriminator 1
	cmpb	$113, -1(%rbp)
	jne	.L16
.L15:
	.loc 1 95 6
	cmpb	$113, -1(%rbp)
	jne	.L17
	.loc 1 96 11
	movl	$0, %eax
	jmp	.L18
.L17:
	.loc 1 98 11
	movl	$1, %eax
.L18:
	.loc 1 100 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	peekpoke_interactively, .-peekpoke_interactively
	.comm	tracee_pid,4,4
	.comm	regs,216,32
	.comm	status,4,4
	.globl	keep_looping
	.data
	.type	keep_looping, @object
	.size	keep_looping, 1
keep_looping:
	.byte	1
	.section	.rodata
	.align 8
.LC46:
	.string	"[USAGE]: ./tracer <pid-of-target-process>"
.LC47:
	.string	"[ CURRENT REGISTER STATE ]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.file 2 "tracer.c"
	.loc 2 18 33
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 2 20 6
	cmpl	$1, -4(%rbp)
	jg	.L21
	.loc 2 21 5
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	.loc 2 22 12
	movl	$-1, %eax
	jmp	.L22
.L21:
	.loc 2 24 25
	movq	-16(%rbp), %rax
	addq	$8, %rax
	.loc 2 24 16
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	.loc 2 24 14
	movl	%eax, tracee_pid(%rip)
	.loc 2 25 3
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$16, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 26 3
	movl	tracee_pid(%rip), %eax
	movl	$0, %edx
	leaq	status(%rip), %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	.loc 2 28 9
	jmp	.L23
.L24:
	.loc 2 29 5
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$9, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 30 5
	movl	tracee_pid(%rip), %eax
	movl	$0, %edx
	leaq	status(%rip), %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	.loc 2 31 5
	movl	tracee_pid(%rip), %eax
	leaq	regs(%rip), %rcx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 32 5
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
	.loc 2 33 5
	subq	$8, %rsp
	pushq	208+regs(%rip)
	pushq	200+regs(%rip)
	pushq	192+regs(%rip)
	pushq	184+regs(%rip)
	pushq	176+regs(%rip)
	pushq	168+regs(%rip)
	pushq	160+regs(%rip)
	pushq	152+regs(%rip)
	pushq	144+regs(%rip)
	pushq	136+regs(%rip)
	pushq	128+regs(%rip)
	pushq	120+regs(%rip)
	pushq	112+regs(%rip)
	pushq	104+regs(%rip)
	pushq	96+regs(%rip)
	pushq	88+regs(%rip)
	pushq	80+regs(%rip)
	pushq	72+regs(%rip)
	pushq	64+regs(%rip)
	pushq	56+regs(%rip)
	pushq	48+regs(%rip)
	pushq	40+regs(%rip)
	pushq	32+regs(%rip)
	pushq	24+regs(%rip)
	pushq	16+regs(%rip)
	pushq	8+regs(%rip)
	pushq	regs(%rip)
	call	print_user_regs_struct
	addq	$224, %rsp
	.loc 2 34 20
	movl	tracee_pid(%rip), %eax
	subq	$8, %rsp
	pushq	208+regs(%rip)
	pushq	200+regs(%rip)
	pushq	192+regs(%rip)
	pushq	184+regs(%rip)
	pushq	176+regs(%rip)
	pushq	168+regs(%rip)
	pushq	160+regs(%rip)
	pushq	152+regs(%rip)
	pushq	144+regs(%rip)
	pushq	136+regs(%rip)
	pushq	128+regs(%rip)
	pushq	120+regs(%rip)
	pushq	112+regs(%rip)
	pushq	104+regs(%rip)
	pushq	96+regs(%rip)
	pushq	88+regs(%rip)
	pushq	80+regs(%rip)
	pushq	72+regs(%rip)
	pushq	64+regs(%rip)
	pushq	56+regs(%rip)
	pushq	48+regs(%rip)
	pushq	40+regs(%rip)
	pushq	32+regs(%rip)
	pushq	24+regs(%rip)
	pushq	16+regs(%rip)
	pushq	8+regs(%rip)
	pushq	regs(%rip)
	movl	%eax, %edi
	call	peekpoke_interactively
	addq	$224, %rsp
	.loc 2 34 18
	movb	%al, keep_looping(%rip)
.L23:
	.loc 2 28 23
	movzbl	keep_looping(%rip), %eax
	.loc 2 28 9
	testb	%al, %al
	jne	.L24
	.loc 2 36 3
	movl	tracee_pid(%rip), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$17, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 2 37 10
	movl	$0, %eax
.L22:
	.loc 2 38 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/sys/wait.h"
	.file 5 "/usr/include/signal.h"
	.file 6 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 7 "/usr/include/unistd.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 11 "/usr/include/stdio.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/user.h"
	.file 14 "/usr/include/x86_64-linux-gnu/sys/ptrace.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x839
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF125
	.byte	0xc
	.long	.LASF126
	.long	.LASF127
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF7
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x5e
	.uleb128 0x4
	.long	.LASF8
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x5e
	.uleb128 0x4
	.long	.LASF9
	.byte	0x3
	.byte	0x9a
	.byte	0xd
	.long	0x57
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x91
	.uleb128 0x8
	.long	.LASF128
	.byte	0x7
	.byte	0x4
	.long	0x3b
	.byte	0xe
	.byte	0x1d
	.byte	0x6
	.long	0x1af
	.uleb128 0x9
	.long	.LASF11
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x1
	.uleb128 0x9
	.long	.LASF13
	.byte	0x2
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.uleb128 0x9
	.long	.LASF17
	.byte	0x6
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.uleb128 0x9
	.long	.LASF19
	.byte	0x8
	.uleb128 0x9
	.long	.LASF20
	.byte	0x9
	.uleb128 0x9
	.long	.LASF21
	.byte	0xc
	.uleb128 0x9
	.long	.LASF22
	.byte	0xd
	.uleb128 0x9
	.long	.LASF23
	.byte	0xe
	.uleb128 0x9
	.long	.LASF24
	.byte	0xf
	.uleb128 0x9
	.long	.LASF25
	.byte	0x10
	.uleb128 0x9
	.long	.LASF26
	.byte	0x11
	.uleb128 0x9
	.long	.LASF27
	.byte	0x12
	.uleb128 0x9
	.long	.LASF28
	.byte	0x13
	.uleb128 0x9
	.long	.LASF29
	.byte	0x18
	.uleb128 0x9
	.long	.LASF30
	.byte	0x19
	.uleb128 0x9
	.long	.LASF31
	.byte	0x1a
	.uleb128 0x9
	.long	.LASF32
	.byte	0x1e
	.uleb128 0x9
	.long	.LASF33
	.byte	0x1f
	.uleb128 0x9
	.long	.LASF34
	.byte	0x20
	.uleb128 0x9
	.long	.LASF35
	.byte	0x21
	.uleb128 0xa
	.long	.LASF36
	.value	0x4200
	.uleb128 0xa
	.long	.LASF37
	.value	0x4201
	.uleb128 0xa
	.long	.LASF38
	.value	0x4202
	.uleb128 0xa
	.long	.LASF39
	.value	0x4203
	.uleb128 0xa
	.long	.LASF40
	.value	0x4204
	.uleb128 0xa
	.long	.LASF41
	.value	0x4205
	.uleb128 0xa
	.long	.LASF42
	.value	0x4206
	.uleb128 0xa
	.long	.LASF43
	.value	0x4207
	.uleb128 0xa
	.long	.LASF44
	.value	0x4208
	.uleb128 0xa
	.long	.LASF45
	.value	0x4209
	.uleb128 0xa
	.long	.LASF46
	.value	0x420a
	.uleb128 0xa
	.long	.LASF47
	.value	0x420b
	.uleb128 0xa
	.long	.LASF48
	.value	0x420c
	.uleb128 0xa
	.long	.LASF49
	.value	0x420d
	.uleb128 0xa
	.long	.LASF50
	.value	0x420e
	.byte	0
	.uleb128 0x4
	.long	.LASF51
	.byte	0x4
	.byte	0x1f
	.byte	0x11
	.long	0x7d
	.uleb128 0xb
	.long	0x1d6
	.long	0x1cb
	.uleb128 0xc
	.long	0x42
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x1bb
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x7
	.long	0x1d0
	.uleb128 0xd
	.long	.LASF52
	.byte	0x5
	.value	0x11e
	.byte	0x1a
	.long	0x1cb
	.uleb128 0xd
	.long	.LASF53
	.byte	0x5
	.value	0x11f
	.byte	0x1a
	.long	0x1cb
	.uleb128 0x4
	.long	.LASF54
	.byte	0x6
	.byte	0xd1
	.byte	0x1b
	.long	0x42
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0xd
	.long	.LASF57
	.byte	0x7
	.value	0x21f
	.byte	0xf
	.long	0x21c
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0xe
	.long	.LASF58
	.byte	0x8
	.byte	0x24
	.byte	0xe
	.long	0x8b
	.uleb128 0xe
	.long	.LASF59
	.byte	0x8
	.byte	0x32
	.byte	0xc
	.long	0x57
	.uleb128 0xe
	.long	.LASF60
	.byte	0x8
	.byte	0x37
	.byte	0xc
	.long	0x57
	.uleb128 0xe
	.long	.LASF61
	.byte	0x8
	.byte	0x3b
	.byte	0xc
	.long	0x57
	.uleb128 0xf
	.long	.LASF100
	.byte	0xd8
	.byte	0x9
	.byte	0x31
	.byte	0x8
	.long	0x3d9
	.uleb128 0x10
	.long	.LASF62
	.byte	0x9
	.byte	0x33
	.byte	0x7
	.long	0x57
	.byte	0
	.uleb128 0x10
	.long	.LASF63
	.byte	0x9
	.byte	0x36
	.byte	0x9
	.long	0x8b
	.byte	0x8
	.uleb128 0x10
	.long	.LASF64
	.byte	0x9
	.byte	0x37
	.byte	0x9
	.long	0x8b
	.byte	0x10
	.uleb128 0x10
	.long	.LASF65
	.byte	0x9
	.byte	0x38
	.byte	0x9
	.long	0x8b
	.byte	0x18
	.uleb128 0x10
	.long	.LASF66
	.byte	0x9
	.byte	0x39
	.byte	0x9
	.long	0x8b
	.byte	0x20
	.uleb128 0x10
	.long	.LASF67
	.byte	0x9
	.byte	0x3a
	.byte	0x9
	.long	0x8b
	.byte	0x28
	.uleb128 0x10
	.long	.LASF68
	.byte	0x9
	.byte	0x3b
	.byte	0x9
	.long	0x8b
	.byte	0x30
	.uleb128 0x10
	.long	.LASF69
	.byte	0x9
	.byte	0x3c
	.byte	0x9
	.long	0x8b
	.byte	0x38
	.uleb128 0x10
	.long	.LASF70
	.byte	0x9
	.byte	0x3d
	.byte	0x9
	.long	0x8b
	.byte	0x40
	.uleb128 0x10
	.long	.LASF71
	.byte	0x9
	.byte	0x40
	.byte	0x9
	.long	0x8b
	.byte	0x48
	.uleb128 0x10
	.long	.LASF72
	.byte	0x9
	.byte	0x41
	.byte	0x9
	.long	0x8b
	.byte	0x50
	.uleb128 0x10
	.long	.LASF73
	.byte	0x9
	.byte	0x42
	.byte	0x9
	.long	0x8b
	.byte	0x58
	.uleb128 0x10
	.long	.LASF74
	.byte	0x9
	.byte	0x44
	.byte	0x16
	.long	0x3f2
	.byte	0x60
	.uleb128 0x10
	.long	.LASF75
	.byte	0x9
	.byte	0x46
	.byte	0x14
	.long	0x3f8
	.byte	0x68
	.uleb128 0x10
	.long	.LASF76
	.byte	0x9
	.byte	0x48
	.byte	0x7
	.long	0x57
	.byte	0x70
	.uleb128 0x10
	.long	.LASF77
	.byte	0x9
	.byte	0x49
	.byte	0x7
	.long	0x57
	.byte	0x74
	.uleb128 0x10
	.long	.LASF78
	.byte	0x9
	.byte	0x4a
	.byte	0xb
	.long	0x65
	.byte	0x78
	.uleb128 0x10
	.long	.LASF79
	.byte	0x9
	.byte	0x4d
	.byte	0x12
	.long	0x34
	.byte	0x80
	.uleb128 0x10
	.long	.LASF80
	.byte	0x9
	.byte	0x4e
	.byte	0xf
	.long	0x49
	.byte	0x82
	.uleb128 0x10
	.long	.LASF81
	.byte	0x9
	.byte	0x4f
	.byte	0x8
	.long	0x3fe
	.byte	0x83
	.uleb128 0x10
	.long	.LASF82
	.byte	0x9
	.byte	0x51
	.byte	0xf
	.long	0x40e
	.byte	0x88
	.uleb128 0x10
	.long	.LASF83
	.byte	0x9
	.byte	0x59
	.byte	0xd
	.long	0x71
	.byte	0x90
	.uleb128 0x10
	.long	.LASF84
	.byte	0x9
	.byte	0x5b
	.byte	0x17
	.long	0x419
	.byte	0x98
	.uleb128 0x10
	.long	.LASF85
	.byte	0x9
	.byte	0x5c
	.byte	0x19
	.long	0x424
	.byte	0xa0
	.uleb128 0x10
	.long	.LASF86
	.byte	0x9
	.byte	0x5d
	.byte	0x14
	.long	0x3f8
	.byte	0xa8
	.uleb128 0x10
	.long	.LASF87
	.byte	0x9
	.byte	0x5e
	.byte	0x9
	.long	0x89
	.byte	0xb0
	.uleb128 0x10
	.long	.LASF88
	.byte	0x9
	.byte	0x5f
	.byte	0xa
	.long	0x1f5
	.byte	0xb8
	.uleb128 0x10
	.long	.LASF89
	.byte	0x9
	.byte	0x60
	.byte	0x7
	.long	0x57
	.byte	0xc0
	.uleb128 0x10
	.long	.LASF90
	.byte	0x9
	.byte	0x62
	.byte	0x8
	.long	0x42a
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF91
	.byte	0xa
	.byte	0x7
	.byte	0x19
	.long	0x252
	.uleb128 0x11
	.long	.LASF129
	.byte	0x9
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF92
	.uleb128 0x6
	.byte	0x8
	.long	0x3ed
	.uleb128 0x6
	.byte	0x8
	.long	0x252
	.uleb128 0xb
	.long	0x91
	.long	0x40e
	.uleb128 0xc
	.long	0x42
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3e5
	.uleb128 0x12
	.long	.LASF93
	.uleb128 0x6
	.byte	0x8
	.long	0x414
	.uleb128 0x12
	.long	.LASF94
	.uleb128 0x6
	.byte	0x8
	.long	0x41f
	.uleb128 0xb
	.long	0x91
	.long	0x43a
	.uleb128 0xc
	.long	0x42
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF95
	.byte	0xb
	.byte	0x89
	.byte	0xe
	.long	0x446
	.uleb128 0x6
	.byte	0x8
	.long	0x3d9
	.uleb128 0xe
	.long	.LASF96
	.byte	0xb
	.byte	0x8a
	.byte	0xe
	.long	0x446
	.uleb128 0xe
	.long	.LASF97
	.byte	0xb
	.byte	0x8b
	.byte	0xe
	.long	0x446
	.uleb128 0xe
	.long	.LASF98
	.byte	0xc
	.byte	0x1a
	.byte	0xc
	.long	0x57
	.uleb128 0xb
	.long	0x1d6
	.long	0x47b
	.uleb128 0x13
	.byte	0
	.uleb128 0x7
	.long	0x470
	.uleb128 0xe
	.long	.LASF99
	.byte	0xc
	.byte	0x1b
	.byte	0x1a
	.long	0x47b
	.uleb128 0xf
	.long	.LASF101
	.byte	0xd8
	.byte	0xd
	.byte	0x2a
	.byte	0x8
	.long	0x5f1
	.uleb128 0x14
	.string	"r15"
	.byte	0xd
	.byte	0x2c
	.byte	0x28
	.long	0x208
	.byte	0
	.uleb128 0x14
	.string	"r14"
	.byte	0xd
	.byte	0x2d
	.byte	0x28
	.long	0x208
	.byte	0x8
	.uleb128 0x14
	.string	"r13"
	.byte	0xd
	.byte	0x2e
	.byte	0x28
	.long	0x208
	.byte	0x10
	.uleb128 0x14
	.string	"r12"
	.byte	0xd
	.byte	0x2f
	.byte	0x28
	.long	0x208
	.byte	0x18
	.uleb128 0x14
	.string	"rbp"
	.byte	0xd
	.byte	0x30
	.byte	0x28
	.long	0x208
	.byte	0x20
	.uleb128 0x14
	.string	"rbx"
	.byte	0xd
	.byte	0x31
	.byte	0x28
	.long	0x208
	.byte	0x28
	.uleb128 0x14
	.string	"r11"
	.byte	0xd
	.byte	0x32
	.byte	0x28
	.long	0x208
	.byte	0x30
	.uleb128 0x14
	.string	"r10"
	.byte	0xd
	.byte	0x33
	.byte	0x28
	.long	0x208
	.byte	0x38
	.uleb128 0x14
	.string	"r9"
	.byte	0xd
	.byte	0x34
	.byte	0x28
	.long	0x208
	.byte	0x40
	.uleb128 0x14
	.string	"r8"
	.byte	0xd
	.byte	0x35
	.byte	0x28
	.long	0x208
	.byte	0x48
	.uleb128 0x14
	.string	"rax"
	.byte	0xd
	.byte	0x36
	.byte	0x28
	.long	0x208
	.byte	0x50
	.uleb128 0x14
	.string	"rcx"
	.byte	0xd
	.byte	0x37
	.byte	0x28
	.long	0x208
	.byte	0x58
	.uleb128 0x14
	.string	"rdx"
	.byte	0xd
	.byte	0x38
	.byte	0x28
	.long	0x208
	.byte	0x60
	.uleb128 0x14
	.string	"rsi"
	.byte	0xd
	.byte	0x39
	.byte	0x28
	.long	0x208
	.byte	0x68
	.uleb128 0x14
	.string	"rdi"
	.byte	0xd
	.byte	0x3a
	.byte	0x28
	.long	0x208
	.byte	0x70
	.uleb128 0x10
	.long	.LASF102
	.byte	0xd
	.byte	0x3b
	.byte	0x28
	.long	0x208
	.byte	0x78
	.uleb128 0x14
	.string	"rip"
	.byte	0xd
	.byte	0x3c
	.byte	0x28
	.long	0x208
	.byte	0x80
	.uleb128 0x14
	.string	"cs"
	.byte	0xd
	.byte	0x3d
	.byte	0x28
	.long	0x208
	.byte	0x88
	.uleb128 0x10
	.long	.LASF103
	.byte	0xd
	.byte	0x3e
	.byte	0x28
	.long	0x208
	.byte	0x90
	.uleb128 0x14
	.string	"rsp"
	.byte	0xd
	.byte	0x3f
	.byte	0x28
	.long	0x208
	.byte	0x98
	.uleb128 0x14
	.string	"ss"
	.byte	0xd
	.byte	0x40
	.byte	0x28
	.long	0x208
	.byte	0xa0
	.uleb128 0x10
	.long	.LASF104
	.byte	0xd
	.byte	0x41
	.byte	0x28
	.long	0x208
	.byte	0xa8
	.uleb128 0x10
	.long	.LASF105
	.byte	0xd
	.byte	0x42
	.byte	0x28
	.long	0x208
	.byte	0xb0
	.uleb128 0x14
	.string	"ds"
	.byte	0xd
	.byte	0x43
	.byte	0x28
	.long	0x208
	.byte	0xb8
	.uleb128 0x14
	.string	"es"
	.byte	0xd
	.byte	0x44
	.byte	0x28
	.long	0x208
	.byte	0xc0
	.uleb128 0x14
	.string	"fs"
	.byte	0xd
	.byte	0x45
	.byte	0x28
	.long	0x208
	.byte	0xc8
	.uleb128 0x14
	.string	"gs"
	.byte	0xd
	.byte	0x46
	.byte	0x28
	.long	0x208
	.byte	0xd0
	.byte	0
	.uleb128 0x15
	.long	.LASF106
	.byte	0x2
	.byte	0xd
	.byte	0x7
	.long	0x1af
	.uleb128 0x9
	.byte	0x3
	.quad	tracee_pid
	.uleb128 0x15
	.long	.LASF107
	.byte	0x2
	.byte	0xe
	.byte	0x19
	.long	0x48c
	.uleb128 0x9
	.byte	0x3
	.quad	regs
	.uleb128 0x15
	.long	.LASF108
	.byte	0x2
	.byte	0xf
	.byte	0x5
	.long	0x57
	.uleb128 0x9
	.byte	0x3
	.quad	status
	.uleb128 0x15
	.long	.LASF109
	.byte	0x2
	.byte	0x10
	.byte	0x5
	.long	0x649
	.uleb128 0x9
	.byte	0x3
	.quad	keep_looping
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF110
	.uleb128 0x16
	.long	.LASF113
	.byte	0x2
	.byte	0x12
	.byte	0x5
	.long	0x57
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x691
	.uleb128 0x17
	.long	.LASF111
	.byte	0x2
	.byte	0x12
	.byte	0xe
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.long	.LASF112
	.byte	0x2
	.byte	0x12
	.byte	0x1b
	.long	0x21c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x16
	.long	.LASF114
	.byte	0x1
	.byte	0x51
	.byte	0x5
	.long	0x649
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x6e1
	.uleb128 0x17
	.long	.LASF106
	.byte	0x1
	.byte	0x51
	.byte	0x22
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x17
	.long	.LASF107
	.byte	0x1
	.byte	0x51
	.byte	0x46
	.long	0x48c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	.LASF117
	.byte	0x1
	.byte	0x53
	.byte	0x8
	.long	0x91
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.long	.LASF115
	.byte	0x1
	.byte	0x33
	.byte	0x6
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x70f
	.uleb128 0x17
	.long	.LASF107
	.byte	0x1
	.byte	0x33
	.byte	0x35
	.long	0x48c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.long	.LASF116
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x75b
	.uleb128 0x17
	.long	.LASF106
	.byte	0x1
	.byte	0x28
	.byte	0x24
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x18
	.long	.LASF118
	.byte	0x1
	.byte	0x29
	.byte	0x11
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.long	.LASF119
	.byte	0x1
	.byte	0x2a
	.byte	0x11
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x19
	.long	.LASF120
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x7b7
	.uleb128 0x17
	.long	.LASF106
	.byte	0x1
	.byte	0x1e
	.byte	0x16
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.byte	0x1e
	.byte	0x30
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.byte	0x1e
	.byte	0x4b
	.long	0x201
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.long	.LASF121
	.byte	0x1
	.byte	0x1f
	.byte	0x11
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x19
	.long	.LASF122
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f4
	.uleb128 0x17
	.long	.LASF106
	.byte	0x1
	.byte	0x17
	.byte	0x2a
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.long	.LASF123
	.byte	0x1
	.byte	0x18
	.byte	0x11
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.long	.LASF130
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.long	.LASF106
	.byte	0x1
	.byte	0xd
	.byte	0x1c
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.byte	0xd
	.byte	0x36
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.long	.LASF124
	.byte	0x1
	.byte	0xf
	.byte	0x11
	.long	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"__off_t"
.LASF50:
	.string	"PTRACE_GET_SYSCALL_INFO"
.LASF25:
	.string	"PTRACE_ATTACH"
.LASF63:
	.string	"_IO_read_ptr"
.LASF75:
	.string	"_chain"
.LASF54:
	.string	"size_t"
.LASF81:
	.string	"_shortbuf"
.LASF122:
	.string	"print_peek_data_interactively"
.LASF127:
	.string	"/home/os/Desktop/os_programming/week8/process_hacking"
.LASF48:
	.string	"PTRACE_SECCOMP_GET_FILTER"
.LASF69:
	.string	"_IO_buf_base"
.LASF45:
	.string	"PTRACE_PEEKSIGINFO"
.LASF56:
	.string	"long long unsigned int"
.LASF11:
	.string	"PTRACE_TRACEME"
.LASF39:
	.string	"PTRACE_SETSIGINFO"
.LASF84:
	.string	"_codecvt"
.LASF20:
	.string	"PTRACE_SINGLESTEP"
.LASF115:
	.string	"print_user_regs_struct"
.LASF21:
	.string	"PTRACE_GETREGS"
.LASF55:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF76:
	.string	"_fileno"
.LASF64:
	.string	"_IO_read_end"
.LASF53:
	.string	"sys_siglist"
.LASF6:
	.string	"long int"
.LASF37:
	.string	"PTRACE_GETEVENTMSG"
.LASF62:
	.string	"_flags"
.LASF85:
	.string	"_wide_data"
.LASF70:
	.string	"_IO_buf_end"
.LASF79:
	.string	"_cur_column"
.LASF93:
	.string	"_IO_codecvt"
.LASF109:
	.string	"keep_looping"
.LASF24:
	.string	"PTRACE_SETFPREGS"
.LASF83:
	.string	"_offset"
.LASF121:
	.string	"ptrace_output"
.LASF105:
	.string	"gs_base"
.LASF29:
	.string	"PTRACE_SYSCALL"
.LASF44:
	.string	"PTRACE_LISTEN"
.LASF49:
	.string	"PTRACE_SECCOMP_GET_METADATA"
.LASF117:
	.string	"input_char"
.LASF124:
	.string	"peek_output"
.LASF92:
	.string	"_IO_marker"
.LASF95:
	.string	"stdin"
.LASF2:
	.string	"unsigned int"
.LASF28:
	.string	"PTRACE_SETFPXREGS"
.LASF87:
	.string	"_freeres_buf"
.LASF3:
	.string	"long unsigned int"
.LASF38:
	.string	"PTRACE_GETSIGINFO"
.LASF67:
	.string	"_IO_write_ptr"
.LASF98:
	.string	"sys_nerr"
.LASF1:
	.string	"short unsigned int"
.LASF116:
	.string	"poke_data_interactively"
.LASF71:
	.string	"_IO_save_base"
.LASF41:
	.string	"PTRACE_SETREGSET"
.LASF82:
	.string	"_lock"
.LASF32:
	.string	"PTRACE_ARCH_PRCTL"
.LASF77:
	.string	"_flags2"
.LASF34:
	.string	"PTRACE_SYSEMU_SINGLESTEP"
.LASF23:
	.string	"PTRACE_GETFPREGS"
.LASF96:
	.string	"stdout"
.LASF125:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF58:
	.string	"optarg"
.LASF30:
	.string	"PTRACE_GET_THREAD_AREA"
.LASF118:
	.string	"byte_offset"
.LASF59:
	.string	"optind"
.LASF119:
	.string	"word"
.LASF68:
	.string	"_IO_write_end"
.LASF103:
	.string	"eflags"
.LASF35:
	.string	"PTRACE_SINGLEBLOCK"
.LASF36:
	.string	"PTRACE_SETOPTIONS"
.LASF129:
	.string	"_IO_lock_t"
.LASF100:
	.string	"_IO_FILE"
.LASF57:
	.string	"__environ"
.LASF33:
	.string	"PTRACE_SYSEMU"
.LASF27:
	.string	"PTRACE_GETFPXREGS"
.LASF89:
	.string	"_mode"
.LASF42:
	.string	"PTRACE_SEIZE"
.LASF78:
	.string	"_old_offset"
.LASF99:
	.string	"sys_errlist"
.LASF74:
	.string	"_markers"
.LASF40:
	.string	"PTRACE_GETREGSET"
.LASF126:
	.string	"tracer.c"
.LASF110:
	.string	"_Bool"
.LASF0:
	.string	"unsigned char"
.LASF102:
	.string	"orig_rax"
.LASF9:
	.string	"__pid_t"
.LASF5:
	.string	"short int"
.LASF14:
	.string	"PTRACE_PEEKUSER"
.LASF91:
	.string	"FILE"
.LASF17:
	.string	"PTRACE_POKEUSER"
.LASF123:
	.string	"input"
.LASF47:
	.string	"PTRACE_SETSIGMASK"
.LASF22:
	.string	"PTRACE_SETREGS"
.LASF61:
	.string	"optopt"
.LASF19:
	.string	"PTRACE_KILL"
.LASF104:
	.string	"fs_base"
.LASF107:
	.string	"regs"
.LASF106:
	.string	"tracee_pid"
.LASF13:
	.string	"PTRACE_PEEKDATA"
.LASF10:
	.string	"char"
.LASF120:
	.string	"poke_data"
.LASF16:
	.string	"PTRACE_POKEDATA"
.LASF43:
	.string	"PTRACE_INTERRUPT"
.LASF60:
	.string	"opterr"
.LASF18:
	.string	"PTRACE_CONT"
.LASF8:
	.string	"__off64_t"
.LASF65:
	.string	"_IO_read_base"
.LASF73:
	.string	"_IO_save_end"
.LASF52:
	.string	"_sys_siglist"
.LASF12:
	.string	"PTRACE_PEEKTEXT"
.LASF88:
	.string	"__pad5"
.LASF15:
	.string	"PTRACE_POKETEXT"
.LASF90:
	.string	"_unused2"
.LASF97:
	.string	"stderr"
.LASF112:
	.string	"argv"
.LASF128:
	.string	"__ptrace_request"
.LASF108:
	.string	"status"
.LASF72:
	.string	"_IO_backup_base"
.LASF101:
	.string	"user_regs_struct"
.LASF80:
	.string	"_vtable_offset"
.LASF111:
	.string	"argc"
.LASF51:
	.string	"pid_t"
.LASF86:
	.string	"_freeres_list"
.LASF26:
	.string	"PTRACE_DETACH"
.LASF114:
	.string	"peekpoke_interactively"
.LASF94:
	.string	"_IO_wide_data"
.LASF46:
	.string	"PTRACE_GETSIGMASK"
.LASF113:
	.string	"main"
.LASF66:
	.string	"_IO_write_base"
.LASF130:
	.string	"print_peek_data"
.LASF31:
	.string	"PTRACE_SET_THREAD_AREA"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
