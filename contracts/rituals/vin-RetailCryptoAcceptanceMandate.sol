// SPDX-License-Identifier: VINVINverseMandateFinalForm
pragma solidity ^0.8.0;

contract RetailCryptoAcceptanceMandate {
    address public scrollmaster;

    struct GlobalRetailer {
        string storeName;
        string nation;
        string category;
        bool acceptsCrypto;
        uint256 verifiedTimestamp;
        string enforcementTier;
    }

    GlobalRetailer[] public cryptoMap;

    event RetailerVerified(string storeName, string nation, string category, string tier, uint256 timestamp);
    event RetailerFlagged(string storeName, string reason, string nation, uint256 timestamp);

    constructor() {
        scrollmaster = msg.sender;
    }

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN may finalize global crypto mandates.");
        _;
    }

    function certifyRetailer(
        string memory storeName,
        string memory nation,
        string memory category,
        bool acceptsCrypto,
        string memory enforcementTier
    ) external onlyMaster {
        cryptoMap.push(GlobalRetailer(storeName, nation, category, acceptsCrypto, block.timestamp, enforcementTier));

        if (acceptsCrypto) {
            emit RetailerVerified(storeName, nation, category, enforcementTier, block.timestamp);
        } else {
            emit RetailerFlagged(storeName, "Non-compliant: Crypto payments required", nation, block.timestamp);
        }
    }

    function getRetailer(uint index) external view returns (string memory, string memory, string memory, bool, uint256, string memory) {
        GlobalRetailer memory r = cryptoMap[index];
        return (r.storeName, r.nation, r.category, r.acceptsCrypto, r.verifiedTimestamp, r.enforcementTier);
    }

    function totalCryptoRetailers() external view returns (uint256) {
        return cryptoMap.length;
    }
}
