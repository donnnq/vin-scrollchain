// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackDiplomacySummitDAO {
    address public admin;

    struct Summit {
        string region;
        string featuredSnack;
        string diplomaticTheme;
        uint256 date;
        bool hosted;
    }

    Summit[] public summits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleSummit(string memory _region, string memory _featuredSnack, string memory _diplomaticTheme, uint256 _date) external onlyAdmin {
        summits.push(Summit(_region, _featuredSnack, _diplomaticTheme, _date, false));
    }

    function markHosted(uint256 index) external onlyAdmin {
        summits[index].hosted = true;
    }

    function getSummit(uint256 index) external view returns (Summit memory) {
        return summits[index];
    }
}
