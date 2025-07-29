// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinYieldGuardian {
    address public lender;
    address public borrower;
    uint256 public principal;
    uint256 public rate;
    uint256 public maturity;
    bool public verifiedScrollHolder;
    mapping(address => bool) public defaultRegistry;

    constructor(address _borrower, uint256 _principal, uint256 _rate, uint256 _maturity) {
        lender = msg.sender;
        borrower = _borrower;
        principal = _principal;
        rate = _rate;
        maturity = _maturity;
    }

    function verifyScrollIdentity(bool _verified) public {
        require(msg.sender == borrower, "Only borrower can verify");
        verifiedScrollHolder = _verified;
    }

    function calculateRepayment() public view returns (uint256) {
        if (!verifiedScrollHolder || defaultRegistry[borrower]) {
            return principal + (rate * 2); // Penalize non-scroll holders or defaulters
        }
        return principal + rate;
    }

    function tag() public pure returns (string memory) {
        return "Guardian Yield Contract with Scroll Ethics (vinYieldGuardian)";
    }
}
