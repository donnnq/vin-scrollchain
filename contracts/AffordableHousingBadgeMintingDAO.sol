// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AffordableHousingBadgeMintingDAO {
    address public admin;

    struct Badge {
        address recipient;
        string category;
        bool minted;
    }

    Badge[] public badges;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mintBadge(address _recipient, string memory _category) external onlyAdmin {
        badges.push(Badge(_recipient, _category, true));
    }

    function getBadge(uint256 index) external view returns (Badge memory) {
        return badges[index];
    }
}
