	.file	"queueByArray.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Size: %d Length: %d Value: %d\12\0"
.LC1:
	.ascii "Now the Queue has no item\0"
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
	call	createQueue
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	enQueue
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %ecx
	call	enQueue
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$3, %ecx
	call	enQueue
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	deQueue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	deQueue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	deQueue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	empty
	testl	%eax, %eax
	je	.L2
	leaq	.LC1(%rip), %rcx
	call	puts
.L2:
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
	.globl	createQueue
	.def	createQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	createQueue
createQueue:
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
	movl	4(%rax), %edx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "Now the Queue has fulled\0"
	.text
	.globl	enQueue
	.def	enQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	enQueue
enQueue:
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
	je	.L10
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$0, %eax
	jmp	.L11
.L10:
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movl	$1, %eax
.L11:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	deQueue
	.def	deQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	deQueue
deQueue:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	empty
	testl	%eax, %eax
	je	.L13
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$0, %eax
	jmp	.L14
.L13:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rcx, %rax
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L15:
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L16
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 4(%rax)
	movl	-8(%rbp), %eax
.L14:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-sjlj-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
