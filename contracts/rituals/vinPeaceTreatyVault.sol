// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPeaceTreatyVault {
    address public treatyCustodian;
    bytes32[] public hashedTerms;

    event TreatyFiled(bytes32 indexed hash);

    modifier onlyCustodian() {
        require(msg.sender == treatyCustodian, "Only custodian may file treaties.");
        _;
    }

    constructor() {
        treatyCustodian = msg.sender;
    }

    function fileTreaty(string memory termsText) external onlyCustodian {
        bytes32 hash = keccak256(abi.encodePacked(termsText));
        hashedTerms.push(hash);
        emit TreatyFiled(hash);
    }

    function getTreatyCount() external view returns (uint256) {
        return hashedTerms.length;
    }

    function verifyTreaty(bytes32 treatyHash) external view returns (bool exists) {
        for (uint256 i = 0; i < hashedTerms.length; i++) {
            if (hashedTerms[i] == treatyHash) {
                return true;
            }
        }
        return false;
    }
}
