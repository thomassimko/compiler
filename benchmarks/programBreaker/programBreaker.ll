target triple="i686"

@GLOBAL = common global i32 0, align 8
@count = common global i32 0, align 8

define i32 @fun2(i32 %x, i32 %y)
{

L1:
	%r0 = icmp eq i32 %x, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	%r3 = sub i32 %x, 1
	%r4 = call i32 @fun2(i32 %r3, i32 %y )
	br label %L2
L2:
	%phi0 = phi i32 [%y, %L3], [%r4, %L4]
	ret i32 %phi0
}

define i32 @fun1(i32 %x, i32 %y, i32 %z)
{

L7:
	%r5 = add i32 5, 6
	%r6 = mul i32 %x, 2
	%r7 = sub i32 %r5, %r6
	%r8 = sdiv i32 4, %y
	%r9 = add i32 %r7, %r8
	%r10 = add i32 %r9, %z
	%r11 = icmp sgt i32 %r10, %y
	%r12 = zext i1 %r11 to i32
	%r13 = trunc i32 %r12 to i1
	br i1 %r13, label %L9, label %L10

L9:
	%r14 = call i32 @fun2(i32 %r10, i32 %x )
	br label %L8
L10:
	%r15 = icmp slt i32 5, 6
	%r16 = zext i1 %r15 to i32
	%r17 = icmp sle i32 %r10, %y
	%r18 = zext i1 %r17 to i32
	%r19 = and i32 %r16, %r18
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L12, label %L13

L11:
	br label %L8
L12:
	%r21 = call i32 @fun2(i32 %r10, i32 %y )
	br label %L8
L13:
	br label %L14
L14:
	br label %L11
L8:
	%phi1 = phi i32 [%r14, %L9], [%r21, %L12], [%r10, %L11]
	ret i32 %phi1
}

define i32 @main()
{

L16:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r22 = load i32, i32* @.read_scratch
	%r23 = icmp slt i32 %r22, 10000
	%r24 = zext i1 %r23 to i32
	%r25 = trunc i32 %r24 to i1
	br i1 %r25, label %L18, label %L19

L18:
	%phi2 = phi i32 [%r22, %L16], [%r27, %L18]
	%r26 = call i32 @fun1(i32 3, i32 %phi2, i32 5 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r26)
	%r27 = add i32 %phi2, 1
	%r28 = icmp slt i32 %r27, 10000
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L18, label %L19

L19:
	br label %L17
L17:
	%phi3 = phi i32 [0, %L19]
	ret i32 %phi3
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8