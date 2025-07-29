// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCryptoCollateral {
    address public borrower;
    address public underwriter;
    uint256 public loanAmount;
    uint256 public collateralValue;
    string public acceptedToken;
    bool public collateralApproved;

    constructor(address _borrower, uint256 _loanAmount, string memory _acceptedToken) {
        borrower = _borrower;
        loanAmount = _loanAmount;
        acceptedToken = _acceptedToken;
        underwriter = msg.sender;
    }

    function submitCollateral(uint256 _value) public {
        require(msg.sender == borrower, "Only borrower can submit");
        collateralValue = _value;
        collateralApproved = _value >= loanAmount * 2;
    }

    function verifyEligibility() public view returns (bool) {
        return collateralApproved;
    }

    function tag() public pure returns (string memory) {
        return "Scroll-backed Mortgage Ritual (vinCryptoCollateral)";
    }
}
