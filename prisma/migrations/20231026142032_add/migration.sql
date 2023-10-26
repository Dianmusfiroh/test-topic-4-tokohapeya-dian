/*
  Warnings:

  - Added the required column `price` to the `Produk` table without a default value. This is not possible if the table is not empty.
  - Added the required column `picture` to the `Profile` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Produk" ADD COLUMN     "price" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "picture" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Transaksi" (
    "id" SERIAL NOT NULL,
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "gross_amount" INTEGER NOT NULL,
    "discount_amount" INTEGER NOT NULL,
    "total_amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "product_id" INTEGER NOT NULL,
    "promo_id" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Transaksi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Promo" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "code" TEXT NOT NULL,
    "discount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Promo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Transaksi_product_id_key" ON "Transaksi"("product_id");

-- CreateIndex
CREATE UNIQUE INDEX "Transaksi_promo_id_key" ON "Transaksi"("promo_id");

-- CreateIndex
CREATE UNIQUE INDEX "Transaksi_userId_key" ON "Transaksi"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Promo_userId_key" ON "Promo"("userId");

-- AddForeignKey
ALTER TABLE "Transaksi" ADD CONSTRAINT "Transaksi_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Produk"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaksi" ADD CONSTRAINT "Transaksi_promo_id_fkey" FOREIGN KEY ("promo_id") REFERENCES "Promo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaksi" ADD CONSTRAINT "Transaksi_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Promo" ADD CONSTRAINT "Promo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
