// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vinCryptoCollateral.sol";
import "./vinYieldGuardian.sol";

contract vinMortgageVerse {
    address public oracle;
    vinCryptoCollateral public collateralScroll;
    vinYieldGuardian public yieldScroll;

    string public verseTag = "vinMortgageVerse: Converging Crypto Realms with Ethical Debt Rites";

    constructor(address _oracle) {
        oracle = _oracle;
    }

    function linkCollateralScroll(address _contractAddress) public {
        require(msg.sender == oracle, "Only oracle may link");
        collateralScroll = vinCryptoCollateral(_contractAddress);
    }

    function linkYieldScroll(address _contractAddress) public {
        require(msg.sender == oracle, "Only oracle may link");
        yieldScroll = vinYieldGuardian(_contractAddress);
    }

    function isMortgageSacramentApproved() public view returns (bool) {
        bool collOK = collateralScroll.verifyEligibility();
        uint256 repayment = yieldScroll.calculateRepayment();
        return collOK && repayment <= (collateralScroll.collateralValue() / 2); // Safe margin
    }

    function scrollVerseTag() public view returns (string memory) {
        return verseTag;
    }
}
