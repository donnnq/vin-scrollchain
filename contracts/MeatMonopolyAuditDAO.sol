// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MeatMonopolyAuditDAO {
    address public steward;

    struct MeatBrand {
        string brandName;
        string parentCompany;
        string meatType;
        uint8 marketShare;
        string emotionalTag;
        uint256 timestamp;
    }

    MeatBrand[] public brands;

    event BrandLogged(
        string brandName,
        string parentCompany,
        string meatType,
        uint8 marketShare,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log meat monopoly rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBrand(
        string memory brandName,
        string memory parentCompany,
        string memory meatType,
        uint8 marketShare,
        string memory emotionalTag
    ) external onlySteard {
        require(marketShare <= 100, "Market share must be between 0 and 100");

        brands.push(MeatBrand({
            brandName: brandName,
            parentCompany: parentCompany,
            meatType: meatType,
            marketShare: marketShare,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BrandLogged(brandName, parentCompany, meatType, marketShare, emotionalTag, block.timestamp);
    }

    function getBrandByIndex(uint256 index) external view returns (
        string memory brandName,
        string memory parentCompany,
        string memory meatType,
        uint8 marketShare,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < brands.length, "Scrollstorm index out of bounds");
        MeatBrand memory b = brands[index];
        return (
            b.brandName,
            b.parentCompany,
            b.meatType,
            b.marketShare,
            b.emotionalTag,
            b.timestamp
        );
    }
}
