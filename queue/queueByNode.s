	.file	"queueByNode.c"
	.text
	.globl	find_head
	.bss
	.align 8
find_head:
	.space 8
	.globl	head_back
	.align 8
head_back:
	.space 8
	.text
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
	movl	$16, %ecx
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
.LC0:
	.ascii "Now the queue has fulled\0"
	.text
	.globl	enqueue
	.def	enqueue;	.scl	2;	.type	32;	.endef
	.seh_proc	enqueue
enqueue:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	full
	testl	%eax, %eax
	je	.L8
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %ecx
	call	exit
.L8:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	empty
	testl	%eax, %eax
	je	.L9
	movl	$16, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L11
.L9:
	movl	$16, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movq	24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	24(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L11:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Now the queue has no element\0"
	.text
	.globl	dequeue
	.def	dequeue;	.scl	2;	.type	32;	.endef
	.seh_proc	dequeue
dequeue:
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
	movl	$1, %ecx
	call	exit
.L13:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, find_head(%rip)
	jmp	.L14
.L15:
	movq	find_head(%rip), %rax
	movq	%rax, head_back(%rip)
	movq	find_head(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, find_head(%rip)
.L14:
	movq	find_head(%rip), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movq	find_head(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	find_head(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	je	.L16
	movq	head_back(%rip), %rax
	movq	$0, 8(%rax)
.L16:
	movq	$0, find_head(%rip)
	movq	$0, head_back(%rip)
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, 4(%rax)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "value: %d pointer: %d\12\0"
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
	movl	$10, %ecx
	call	enqueue
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$5, %ecx
	call	enqueue
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	call	enqueue
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	dequeue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	dequeue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	dequeue
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movq	find_head(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	head_back(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-sjlj-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
