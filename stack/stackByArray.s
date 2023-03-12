	.file	"stackByArray.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Now the top element of stack: %d\12\0"
.LC1:
	.ascii "Now the length of stack: %d\12\0"
	.align 8
.LC2:
	.ascii "Now to pop the top element of stack: %d\12\0"
.LC3:
	.ascii "Poped: %d\12\0"
	.align 8
.LC4:
	.ascii "The stack has completely poped\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movl	$10, %ecx
	call	create_stack
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$10, %ecx
	call	push
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$5, %ecx
	call	push
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$15, %ecx
	call	push
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	length
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	pop
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	length
	movl	%eax, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	pop
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
.L2:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	empty
	testl	%eax, %eax
	je	.L3
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	empty
	testl	%eax, %eax
	je	.L4
	leaq	.LC4(%rip), %rcx
	call	printf
.L4:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	create_stack
	.def	create_stack;	.scl	2;	.type	32;	.endef
	.seh_proc	create_stack
create_stack:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$16, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	$-1, 4(%rax)
	movl	16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	empty
	.def	empty;	.scl	2;	.type	32;	.endef
	.seh_proc	empty
empty:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$-1, %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	full
	.def	full;	.scl	2;	.type	32;	.endef
	.seh_proc	full
full:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	(%rax), %edx
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	length
	.def	length;	.scl	2;	.type	32;	.endef
	.seh_proc	length
length:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	addl	$1, %eax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Warning: the stack of size has fulled\0"
	.text
	.globl	push
	.def	push;	.scl	2;	.type	32;	.endef
	.seh_proc	push
push:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	full
	testl	%eax, %eax
	je	.L14
	leaq	.LC5(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L13
.L14:
	movq	24(%rbp), %rax
	movq	8(%rax), %rcx
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
.L13:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "Warning: the stack has not element\0"
	.text
	.globl	pop
	.def	pop;	.scl	2;	.type	32;	.endef
	.seh_proc	pop
pop:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	empty
	testl	%eax, %eax
	je	.L17
	leaq	.LC6(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L18
.L17:
	movq	16(%rbp), %rax
	movq	8(%rax), %r8
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	movq	16(%rbp), %rcx
	movl	%edx, 4(%rcx)
	cltq
	salq	$2, %rax
	addq	%r8, %rax
	movl	(%rax), %eax
.L18:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-sjlj-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
