/*
  Warnings:

  - Made the column `complete` on table `Todo` required. This step will fail if there are existing NULL values in that column.
  - Made the column `title` on table `Todo` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updatedAt` on table `Todo` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Todo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "complete" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Todo" ("complete", "createdAt", "id", "title", "updatedAt") SELECT "complete", coalesce("createdAt", CURRENT_TIMESTAMP) AS "createdAt", "id", "title", "updatedAt" FROM "Todo";
DROP TABLE "Todo";
ALTER TABLE "new_Todo" RENAME TO "Todo";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
