// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackEquityDAO {
    address public steward;

    struct Snack {
        string name;
        string purokOrigin;
        uint256 communityPrice;
        bool pulutanCertified;
    }

    Snack[] public snackRegistry;

    event SnackRegistered(string name, string purokOrigin, uint256 communityPrice);
    event FlavorAuditTriggered(string name, string reason);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function registerSnack(
        string memory name,
        string memory purokOrigin,
        uint256 communityPrice,
        bool pulutanCertified
    ) public onlySteward {
        snackRegistry.push(Snack(name, purokOrigin, communityPrice, pulutanCertified));
        emit SnackRegistered(name, purokOrigin, communityPrice);
    }

    function triggerFlavorAudit(string memory name, string memory reason) public onlySteward {
        emit FlavorAuditTriggered(name, reason);
    }
}
