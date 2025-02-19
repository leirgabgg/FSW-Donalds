/*
  Warnings:

  - You are about to drop the column `menuCategoryID` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `restaurantID` on the `Product` table. All the data in the column will be lost.
  - Changed the type of `consumptionMethod` on the `Order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `menuCategoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `restaurantId` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ConsumptionMethod" AS ENUM ('TAKEAWAY', 'DINE_IN');

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_menuCategoryID_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_restaurantID_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "consumptionMethod",
ADD COLUMN     "consumptionMethod" "ConsumptionMethod" NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "menuCategoryID",
DROP COLUMN "restaurantID",
ADD COLUMN     "menuCategoryId" TEXT NOT NULL,
ADD COLUMN     "restaurantId" TEXT NOT NULL;

-- DropEnum
DROP TYPE "OrderConsumptionMethod";

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCategoryId_fkey" FOREIGN KEY ("menuCategoryId") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
