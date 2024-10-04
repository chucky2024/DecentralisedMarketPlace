import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const JobMarketplaceModule = buildModule("JobMarketplaceModule", (m) => {

    const jobMarketplace= m.contract("JobMarketplace");

    return { jobMarketplace };
});

export default JobMarketplaceModule;
// 0xB58d009dcB331D1C073FBD5F2d43B444688A96ad