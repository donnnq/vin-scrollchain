// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryIntegritySummitDAO {
    address public admin;

    struct Summit {
        string region;
        string focusArea;
        uint256 date;
        bool convened;
    }

    Summit[] public summits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleSummit(string memory _region, string memory _focusArea, uint256 _date) external onlyAdmin {
        summits.push(Summit(_region, _focusArea, _date, false));
    }

    function markConvened(uint256 index) external onlyAdmin {
        summits[index].convened = true;
    }

    function getSummit(uint256 index) external view returns (Summit memory) {
        return summits[index];
    }
}
