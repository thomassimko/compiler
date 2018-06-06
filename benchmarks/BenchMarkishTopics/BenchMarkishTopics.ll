target triple="i686"

%struct.intList = type {i32, %struct.intList*}
@intList = common global i32 0, align 8

define i32 @length(%struct.intList* %list)
{

L1:
	%r0 = icmp eq %struct.intList* %list, null
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = getelementptr %struct.intList , %struct.intList* %list, i1 0, i32 1
	%r4 = load %struct.intList*, %struct.intList** %r3
	%r5 = call i32 @length(%struct.intList* %r4 )
	%r6 = add i32 1, %r5
	br label %L2
L2:
	%r7 = phi i32 [0, %L3], [%r6, %L5]
	ret i32 %r7
}

define %struct.intList* @addToFront(%struct.intList* %list, i32 %element)
{

L7:
	%r8 = icmp eq %struct.intList* %list, null
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L9, label %L10

L9:
	%r11 = call i8* @malloc(i32 16)
	%r12 = bitcast i8* %r11 to %struct.intList*
	%r13 = getelementptr %struct.intList , %struct.intList* %r12, i1 0, i32 0
	store i32 %element, i32* %r13
	%r14 = getelementptr %struct.intList , %struct.intList* %r12, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r14
	br label %L8
L10:
	br label %L11
L11:
	%r15 = call i8* @malloc(i32 16)
	%r16 = bitcast i8* %r15 to %struct.intList*
	%r17 = getelementptr %struct.intList , %struct.intList* %r16, i1 0, i32 0
	store i32 %element, i32* %r17
	%r18 = getelementptr %struct.intList , %struct.intList* %r16, i1 0, i32 1
	store %struct.intList* %list, %struct.intList** %r18
	br label %L8
L8:
	%r19 = phi %struct.intList* [%r12, %L9], [%r16, %L11]
	ret %struct.intList* %r19
}

define %struct.intList* @deleteFirst(%struct.intList* %list)
{

L13:
	%r20 = icmp eq %struct.intList* %list, null
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L15, label %L16

L15:
	br label %L14
L16:
	br label %L17
L17:
	%r23 = getelementptr %struct.intList , %struct.intList* %list, i1 0, i32 1
	%r24 = load %struct.intList*, %struct.intList** %r23
	%r25 = bitcast %struct.intList* %list to i8*
	call void @free(i8* %r25 )
	br label %L14
L14:
	%r26 = phi %struct.intList* [null, %L15], [%r24, %L17]
	ret %struct.intList* %r26
}

define i32 @main()
{

L19:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r27 = load i32, i32* @.read_scratch
	store i32 %r27, i32* @intList
	%r28 = load i32, i32* @intList
	%r29 = icmp sgt i32 %r28, 0
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L21, label %L22

L21:
	%r32 = phi %struct.intList* [null, %L19], [%r34, %L21]
	%r61 = phi i32 [0, %L19], [0, %L21]
	%r33 = load i32, i32* @intList
	%r34 = call %struct.intList* @addToFront(%struct.intList* %r32, i32 %r33 )
	%r35 = getelementptr %struct.intList , %struct.intList* %r34, i1 0, i32 0
	%r36 = load i32, i32* %r35
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r36)
	%r37 = load i32, i32* @intList
	%r38 = sub i32 %r37, 1
	store i32 %r38, i32* @intList
	%r39 = load i32, i32* @intList
	%r40 = icmp sgt i32 %r39, 0
	%r41 = zext i1 %r40 to i32
	%r42 = trunc i32 %r41 to i1
	br i1 %r42, label %L21, label %L22

L22:
	%r43 = phi %struct.intList* [null, %L19], [%r34, %L21]
	%r60 = phi i32 [0, %L19], [0, %L21]
	%r44 = call i32 @length(%struct.intList* %r43 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r44)
	%r45 = call i32 @length(%struct.intList* %r43 )
	%r46 = icmp sgt i32 %r45, 0
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L23, label %L24

L23:
	%r49 = phi i32 [0, %L22], [%r53, %L23]
	%r50 = phi %struct.intList* [%r43, %L22], [%r55, %L23]
	%r51 = getelementptr %struct.intList , %struct.intList* %r50, i1 0, i32 0
	%r52 = load i32, i32* %r51
	%r53 = add i32 %r49, %r52
	%r54 = call i32 @length(%struct.intList* %r50 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r54)
	%r55 = call %struct.intList* @deleteFirst(%struct.intList* %r50 )
	%r56 = call i32 @length(%struct.intList* %r55 )
	%r57 = icmp sgt i32 %r56, 0
	%r58 = zext i1 %r57 to i32
	%r59 = trunc i32 %r58 to i1
	br i1 %r59, label %L23, label %L24

L24:
	%r62 = phi i32 [0, %L22], [%r53, %L23]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r62)
	br label %L20
L20:
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