# Metal AI Robot PRO — Gradle Fix

هذه نسخة مستقرة مخصصة أولاً لإخراج APK على Codemagic.

مهم: استبدل محتويات المستودع بهذه الملفات بحيث يكون lib وandroid في الجذر.

سبب التعديل:
- إزالة kotlin-android من app/build.gradle.
- استخدام AGP 8.9.2 + Gradle 8.11.1.
- تعطيل built-in Kotlin/new DSL مؤقتاً لتجنب مسار AGP 9 في أول بناء.
- استخدام Java MainActivity.

بعد نجاح APK نعيد إضافة ميزات الذكاء الاصطناعي، الذاكرة، الكاميرا والصوت تدريجياً.
