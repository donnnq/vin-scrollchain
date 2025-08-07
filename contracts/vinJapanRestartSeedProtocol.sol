// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title vinJapanRestartSeedProtocol
 * @dev Distributes revival grants to Japan-based entities post-economic delay, using empathy and civic resonance.
 */

contract vinJapanRestartSeedProtocol {
    address public benevolentFounder;
    uint256 public maxSeedAmount = 5_000_000; // in yen or tokenized equivalence

    struct Grant {
        string recipientName;
        string purpose;
        uint256 seedAmount;
        bool isDeployed;
        string region;
        uint256 dignityScore;
    }

    Grant[] public grants;

    event GrantDeployed(string recipientName, uint256 amount, string region, uint256 dignityScore);

    modifier onlyFounder() {
        require(msg.sender == benevolentFounder, "Restricted to founder");
        _;
    }

    constructor() {
        benevolentFounder = msg.sender;
    }

    function deployGrant(
        string memory name,
        string memory purpose,
        string memory region,
        uint256 amount,
        uint256 dignityScore
    ) public onlyFounder {
        require(amount <= maxSeedAmount, "Exceeds seed ceiling");

        grants.push(Grant(name, purpose, amount, true, region, dignityScore));
        emit GrantDeployed(name, amount, region, dignityScore);
    }

    function updateMaxSeed(uint256 newMax) public onlyFounder {
        maxSeedAmount = newMax;
    }

    function viewAllGrants() public view returns (Grant[] memory) {
        return grants;
    }
}
