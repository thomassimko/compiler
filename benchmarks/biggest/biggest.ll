target triple="i686"

%struct.IntList = type {i32, %struct.IntList*}

define %struct.IntList* @getIntList()
{

L1:
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.IntList*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r2 = load i32, i32* @.read_scratch
	%r3 = sub i32 0, 1
	%r4 = icmp eq i32 %r2, %r3
	%r5 = zext i1 %r4 to i32
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L3, label %L4

L3:
	%r7 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 0
	store i32 %r2, i32* %r7
	%r8 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r8
	br label %L2
L4:
	%r9 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 0
	store i32 %r2, i32* %r9
	%r10 = call %struct.IntList* @getIntList()
	%r11 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* %r10, %struct.IntList** %r11
	br label %L2
L2:
	%r12 = phi %struct.IntList* [%r1, %L3], [%r1, %L4]
	ret %struct.IntList* %r12
}

define i32 @biggest(i32 %num1, i32 %num2)
{

L7:
	%r13 = icmp sgt i32 %num1, %num2
	%r14 = zext i1 %r13 to i32
	%r15 = trunc i32 %r14 to i1
	br i1 %r15, label %L9, label %L10

L9:
	br label %L8
L10:
	br label %L8
L8:
	%r16 = phi i32 [%num1, %L9], [%num2, %L10]
	ret i32 %r16
}

define i32 @biggestInList(%struct.IntList* %list)
{

L13:
	%r17 = getelementptr %struct.IntList , %struct.IntList* %list, i1 0, i32 0
	%r18 = load i32, i32* %r17
	%r19 = getelementptr %struct.IntList , %struct.IntList* %list, i1 0, i32 1
	%r20 = load %struct.IntList*, %struct.IntList** %r19
	%r21 = icmp ne %struct.IntList* %r20, null
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L15, label %L16

L15:
	%r24 = phi i32 [%r18, %L13], [%r28, %L15]
	%r25 = phi %struct.IntList* [%list, %L13], [%r30, %L15]
	%r26 = getelementptr %struct.IntList , %struct.IntList* %r25, i1 0, i32 0
	%r27 = load i32, i32* %r26
	%r28 = call i32 @biggest(i32 %r24, i32 %r27 )
	%r29 = getelementptr %struct.IntList , %struct.IntList* %r25, i1 0, i32 1
	%r30 = load %struct.IntList*, %struct.IntList** %r29
	%r31 = getelementptr %struct.IntList , %struct.IntList* %r30, i1 0, i32 1
	%r32 = load %struct.IntList*, %struct.IntList** %r31
	%r33 = icmp ne %struct.IntList* %r32, null
	%r34 = zext i1 %r33 to i32
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L15, label %L16

L16:
	%r36 = phi i32 [%r18, %L13], [%r28, %L15]
	br label %L14
L14:
	%r37 = phi i32 [%r36, %L16]
	ret i32 %r37
}

define i32 @main()
{

L18:
	%r38 = call %struct.IntList* @getIntList()
	%r39 = call i32 @biggestInList(%struct.IntList* %r38 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r39)
	br label %L19
L19:
	%r40 = phi i32 [0, %L18]
	ret i32 %r40
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8