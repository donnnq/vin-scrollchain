// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinFairTaxContract {
    address public scrollkeeper;
    mapping(string => uint256) public verifiedTaxes;
    mapping(string => bool) public miscellaneousBlacklist;

    event TaxUpdated(string indexed category, uint256 newRate);
    event MiscFeeFlagged(string indexed category, bool removed);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function updateTaxRate(string memory category, uint256 newRate) external onlyScrollkeeper {
        verifiedTaxes[category] = newRate;
        emit TaxUpdated(category, newRate);
    }

    function removeMiscFee(string memory feeCategory) external onlyScrollkeeper {
        miscellaneousBlacklist[feeCategory] = true;
        emit MiscFeeFlagged(feeCategory, true);
    }

    function getTaxRate(string memory category) external view returns (uint256) {
        return verifiedTaxes[category];
    }

    function isMiscRemoved(string memory feeCategory) external view returns (bool) {
        return miscellaneousBlacklist[feeCategory];
    }
}
