// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollLegacyBadge {
    address public issuer;
    mapping(address => bool) public badgeHolders;

    event BadgeMinted(address indexed to, string badgeTitle, uint256 timestamp);

    modifier onlyIssuer() {
        require(msg.sender == issuer, "Not authorized.");
        _;
    }

    constructor() {
        issuer = msg.sender;
    }

    function mintBadge(address _to) external onlyIssuer {
        require(!badgeHolders[_to], "Already minted.");
        badgeHolders[_to] = true;
        emit BadgeMinted(_to, "Scrollkeeper Ritual Completion: All Tests Passed", block.timestamp);
    }

    function checkBadge(address _user) external view returns (bool) {
        return badgeHolders[_user];
    }
}
