// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BeautyProductAuthenticityDAO {
    address public steward;

    struct AuthenticityEntry {
        string brandName;
        string originCountry;
        string verificationProtocol;
        string emotionalTag;
    }

    AuthenticityEntry[] public registry;

    event BeautyProductVerified(string brandName, string originCountry, string verificationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function verifyProduct(
        string memory brandName,
        string memory originCountry,
        string memory verificationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuthenticityEntry(brandName, originCountry, verificationProtocol, emotionalTag));
        emit BeautyProductVerified(brandName, originCountry, verificationProtocol, emotionalTag);
    }
}
