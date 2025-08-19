// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.0;

contract vinContractorRedemptionClause {
    address public steward;
    mapping(address => bool) public redemptionRequested;
    mapping(address => uint256) public trustRestored;

    event RedemptionRequested(address indexed contractor, string message);
    event TrustRestored(address indexed contractor, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized mythic steward");
        _;
    }

    function requestRedemption(address contractor, string memory message) public onlySteward {
        redemptionRequested[contractor] = true;
        emit RedemptionRequested(contractor, message);
    }

    function restoreTrust(address contractor, uint256 amount) public onlySteward {
        require(redemptionRequested[contractor], "Redemption not requested");
        trustRestored[contractor] += amount;
        emit TrustRestored(contractor, amount);
    }
}
