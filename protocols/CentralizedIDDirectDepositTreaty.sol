// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CentralizedIDDirectDepositTreaty {
    address public steward;

    struct Citizen {
        string nationalID;
        string fullName;
        string bankAccount;
        string barangay;
        bool isVerified;
    }

    mapping(string => Citizen) public citizens;

    event CitizenVerified(string nationalID, string fullName, string bankAccount, string barangay);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function verifyCitizen(
        string memory nationalID,
        string memory fullName,
        string memory bankAccount,
        string memory barangay
    ) public onlySteward {
        citizens[nationalID] = Citizen(nationalID, fullName, bankAccount, barangay, true);
        emit CitizenVerified(nationalID, fullName, bankAccount, barangay);
    }
}
