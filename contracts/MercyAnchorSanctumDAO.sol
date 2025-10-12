// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MercyAnchorSanctumDAO
 * @dev Emotionally tagged smart contract to anchor mercy, dignity, and planetary consequence
 * through scrollchain-sealed support, opt-in sanctuary, and transparent allocation.
 */

contract MercyAnchorSanctumDAO {
    address public steward;
    mapping(address => bool) public sanctumRecipients;
    mapping(address => uint256) public mercyCredits;

    event MercyGranted(address indexed recipient, uint256 amount, string emotionalTag);
    event RecipientRegistered(address indexed recipient, string dignityProtocol);
    event SanctuaryFunded(address indexed donor, uint256 amount, string emotionalTag);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy mercy protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerRecipient(address recipient, string memory dignityProtocol) external onlySteward {
        sanctumRecipients[recipient] = true;
        emit RecipientRegistered(recipient, dignityProtocol);
    }

    function grantMercy(address recipient, uint256 amount, string memory emotionalTag) external onlySteward {
        require(sanctumRecipients[recipient], "Recipient not yet registered in sanctum");
        mercyCredits[recipient] += amount;
        emit MercyGranted(recipient, amount, emotionalTag);
    }

    function fundSanctum(string memory emotionalTag) external payable {
        require(msg.value > 0, "Sanctum must be funded with emotional weight");
        emit SanctuaryFunded(msg.sender, msg.value, emotionalTag);
    }

    function getSanctumBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getMercyCredits(address recipient) external view returns (uint256) {
        return mercyCredits[recipient];
    }
}
