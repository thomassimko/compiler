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
	%r5 = phi i32 [%y, %L3], [%r4, %L4]
	ret i32 %r5
}

define i32 @fun1(i32 %x, i32 %y, i32 %z)
{

L7:
	%r6 = add i32 5, 6
	%r7 = mul i32 %x, 2
	%r8 = sub i32 %r6, %r7
	%r9 = sdiv i32 4, %y
	%r10 = add i32 %r8, %r9
	%r11 = add i32 %r10, %z
	%r12 = icmp sgt i32 %r11, %y
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L9, label %L10

L9:
	%r15 = call i32 @fun2(i32 %r11, i32 %x )
	br label %L8
L10:
	%r16 = icmp slt i32 5, 6
	%r17 = zext i1 %r16 to i32
	%r18 = icmp sle i32 %r11, %y
	%r19 = zext i1 %r18 to i32
	%r20 = and i32 %r17, %r19
	%r21 = trunc i32 %r20 to i1
	br i1 %r21, label %L12, label %L13

L11:
	br label %L8
L12:
	%r22 = call i32 @fun2(i32 %r11, i32 %y )
	br label %L8
L13:
	br label %L14
L14:
	br label %L11
L8:
	%r23 = phi i32 [%r15, %L9], [%r22, %L12], [%r11, %L11]
	ret i32 %r23
}

define i32 @main()
{

L16:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r24 = load i32, i32* @.read_scratch
	%r25 = icmp slt i32 %r24, 10000
	%r26 = zext i1 %r25 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L18, label %L19

L18:
	%r28 = phi i32 [%r24, %L16], [%r30, %L18]
	%r29 = call i32 @fun1(i32 3, i32 %r28, i32 5 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r29)
	%r30 = add i32 %r28, 1
	%r31 = icmp slt i32 %r30, 10000
	%r32 = zext i1 %r31 to i32
	%r33 = trunc i32 %r32 to i1
	br i1 %r33, label %L18, label %L19

L19:
	br label %L17
L17:
	%r34 = phi i32 [0, %L19]
	ret i32 %r34
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8