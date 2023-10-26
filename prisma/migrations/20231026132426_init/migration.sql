-- AlterTable
ALTER TABLE "Profile" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "address" DROP NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "username" DROP NOT NULL,
ALTER COLUMN "password" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Produk" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "jenis_produk_id" INTEGER NOT NULL,

    CONSTRAINT "Produk_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Jenis_Produk" (
    "id" SERIAL NOT NULL,
    "nama" TEXT,

    CONSTRAINT "Jenis_Produk_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Produk_name_key" ON "Produk"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Produk_jenis_produk_id_key" ON "Produk"("jenis_produk_id");

-- CreateIndex
CREATE UNIQUE INDEX "Jenis_Produk_nama_key" ON "Jenis_Produk"("nama");

-- AddForeignKey
ALTER TABLE "Produk" ADD CONSTRAINT "Produk_jenis_produk_id_fkey" FOREIGN KEY ("jenis_produk_id") REFERENCES "Jenis_Produk"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
