// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterFundTransparencyProtocol {
    address public steward;

    struct FundRelease {
        string agency;
        uint256 amount;
        string purpose;
        string releaseDate;
        string region;
    }

    FundRelease[] public releases;

    event FundReleased(string agency, uint256 amount, string purpose, string releaseDate, string region);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function releaseFund(
        string memory agency,
        uint256 amount,
        string memory purpose,
        string memory releaseDate,
        string memory region
    ) public onlySteward {
        releases.push(FundRelease(agency, amount, purpose, releaseDate, region));
        emit FundReleased(agency, amount, purpose, releaseDate, region);
    }
}
