target triple="i686"

%struct.IntHolder = type {i32}
@interval = common global i32 0, align 8
@end = common global i32 0, align 8

define i32 @multBy4xTimes(%struct.IntHolder* %num, i32 %timesLeft)
{

L1:
	%r0 = icmp sle i32 %timesLeft, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r4 = load i32, i32* %r3
	br label %L2
L4:
	br label %L5
L5:
	%r5 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r6 = load i32, i32* %r5
	%r7 = mul i32 4, %r6
	%r8 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	store i32 %r7, i32* %r8
	%r9 = sub i32 %timesLeft, 1
	call i32 @multBy4xTimes(%struct.IntHolder* %num, i32 %r9 )
	%r10 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r11 = load i32, i32* %r10
	br label %L2
L2:
	%r12 = phi i32 [%r4, %L3], [%r11, %L5]
	ret i32 %r12
}

define i32 @main()
{

L10:
	%r25 = call i8* @malloc(i32 8)
	%r26 = bitcast i8* %r25 to %struct.IntHolder*
	store i32 1000000, i32* @end
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r27 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r28 = load i32, i32* @.read_scratch
	store i32 %r28, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r27)
	%r29 = load i32, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r29)
	br i1 1, label %L12, label %L13

L12:
	%r67 = phi %struct.IntHolder* [%r26, %L10], [%r77, %L15]
	%r70 = phi i32 [0, %L10], [%r73, %L15]
	%r82 = phi i32 [0, %L10], [%r81, %L15]
	%r33 = load i32, i32* @end
	%r34 = icmp sle i32 0, %r33
	%r35 = zext i1 %r34 to i32
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L14, label %L15

L14:
	%r47 = phi i32 [0, %L12], [%r62, %L18]
	%r49 = phi %struct.IntHolder* [%r67, %L12], [%r68, %L18]
	%r72 = phi i32 [%r70, %L12], [%r71, %L18]
	%r46 = mul i32 3628800, 11
	%r48 = add i32 %r47, 1
	%r50 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	store i32 %r48, i32* %r50
	call i32 @multBy4xTimes(%struct.IntHolder* %r49, i32 2 )
	%r13 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	%r14 = load i32, i32* %r13
	%r15 = sdiv i32 %r14, 2
	%r16 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	store i32 %r15, i32* %r16
	%r17 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	%r18 = load i32, i32* %r17
	%r19 = sdiv i32 %r18, 2
	%r20 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	store i32 %r19, i32* %r20
	%r21 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	%r22 = load i32, i32* %r21
	%r23 = sdiv i32 %r22, 2
	%r24 = getelementptr %struct.IntHolder , %struct.IntHolder* %r49, i1 0, i32 0
	store i32 %r23, i32* %r24
	%r53 = load i32, i32* @interval
	%r54 = sub i32 %r53, 1
	%r57 = icmp sle i32 %r54, 0
	%r58 = zext i1 %r57 to i32
	%r59 = trunc i32 %r58 to i1
	br i1 %r59, label %L16, label %L17

L16:
	br label %L18
L17:
	br label %L18
L18:
	%r60 = phi i32 [%r48, %L16], [%r48, %L17]
	%r61 = phi i32 [1, %L16], [%r54, %L17]
	%r68 = phi %struct.IntHolder* [%r49, %L16], [%r49, %L17]
	%r71 = phi i32 [%r72, %L16], [%r72, %L17]
	%r83 = phi i32 [39916800, %L16], [39916800, %L17]
	%r62 = add i32 %r60, %r61
	%r63 = load i32, i32* @end
	%r64 = icmp sle i32 %r62, %r63
	%r65 = zext i1 %r64 to i32
	%r66 = trunc i32 %r65 to i1
	br i1 %r66, label %L14, label %L15

L15:
	%r69 = phi i32 [%r70, %L12], [%r71, %L18]
	%r77 = phi %struct.IntHolder* [%r67, %L12], [%r68, %L18]
	%r79 = phi i32 [0, %L12], [%r62, %L18]
	%r81 = phi i32 [%r82, %L12], [39916800, %L18]
	%r73 = add i32 %r69, 1
	%r74 = icmp slt i32 %r73, 50
	%r75 = zext i1 %r74 to i32
	%r76 = trunc i32 %r75 to i1
	br i1 %r76, label %L12, label %L13

L13:
	%r78 = phi i32 [0, %L10], [%r79, %L15]
	%r80 = phi i32 [0, %L10], [%r81, %L15]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r78)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r80)
	br label %L11
L11:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8