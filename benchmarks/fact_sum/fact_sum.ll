target triple="i686"



define i32 @sum(i32 %a, i32 %b)
{

L1:
	%r0 = add i32 %a, %b
	br label %L2
L2:
	%phi0 = phi i32 [%r0, %L1]
	ret i32 %phi0
}

define i32 @fact(i32 %n)
{

L4:
	%r1 = icmp eq i32 %n, 1
	%r2 = zext i1 %r1 to i32
	%r3 = icmp eq i32 %n, 0
	%r4 = zext i1 %r3 to i32
	%r5 = or i32 %r2, %r4
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L6, label %L7

L6:
	br label %L5
L7:
	br label %L8
L8:
	%r7 = icmp sle i32 %n, 1
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L9, label %L10

L9:
	%r10 = sub i32 0, 1
	%r11 = mul i32 %r10, %n
	%r12 = call i32 @fact(i32 %r11 )
	br label %L5
L10:
	br label %L11
L11:
	%r13 = sub i32 %n, 1
	%r14 = call i32 @fact(i32 %r13 )
	%r15 = mul i32 %n, %r14
	br label %L5
L5:
	%phi1 = phi i32 [1, %L6], [%r12, %L9], [%r15, %L11]
	ret i32 %phi1
}

define i32 @main()
{

L13:
	%r16 = sub i32 0, 1
	%r17 = icmp ne i32 0, %r16
	%r18 = zext i1 %r17 to i32
	%r19 = trunc i32 %r18 to i1
	br i1 %r19, label %L15, label %L16

L15:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r20 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r21 = load i32, i32* @.read_scratch
	%r22 = call i32 @fact(i32 %r20 )
	%r23 = call i32 @fact(i32 %r21 )
	%r24 = call i32 @sum(i32 %r22, i32 %r23 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r24)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r25 = load i32, i32* @.read_scratch
	%r26 = sub i32 0, 1
	%r27 = icmp ne i32 %r25, %r26
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L15, label %L16

L16:
	br label %L14
L14:
	%phi2 = phi i32 [0, %L16]
	ret i32 %phi2
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8