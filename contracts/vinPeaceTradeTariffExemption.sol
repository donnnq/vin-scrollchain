// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title vinPeaceTradeTariffExemption
 * @dev Diplomatic scroll encoding India-US tariff exemptions in exchange for maritime guardianship supporting PH sovereignty.
 */

contract vinPeaceTradeTariffExemption {
    address public initiator;
    string public peacePurpose = "Guarding Philippine Sea through Indo-Pacific Naval Harmony";
    string public allianceSymbol = "🛡️🌊📜";

    struct TradePrivilege {
        string beneficiaryCountry;
        string commodityType;
        uint256 tariffReductionPercent;
        string conditionalDuty; // e.g., naval support, peace patrol frequency
    }

    TradePrivilege[] public privileges;

    event TariffExempted(string beneficiaryCountry, string commodityType, uint256 tariffReductionPercent, string reason);

    modifier onlyInitiator() {
        require(msg.sender == initiator, "Access restricted to protocol initiator");
        _;
    }

    constructor() {
        initiator = msg.sender;

        // Sample exemptions
        privileges.push(TradePrivilege("India", "Pharmaceuticals", 26, "Deploy BrahMos Naval Defense Patrol every 90 days in PH waters"));
        privileges.push(TradePrivilege("India", "Textiles", 18, "Facilitate 3 Indo-PH maritime peace dialogues yearly"));
    }

    function extendPrivilege(
        string memory _country,
        string memory _commodity,
        uint256 _tariffReduction,
        string memory _duty
    ) public onlyInitiator {
        privileges.push(TradePrivilege(_country, _commodity, _tariffReduction, _duty));
        emit TariffExempted(_country, _commodity, _tariffReduction, _duty);
    }

    function viewPrivileges() public view returns (TradePrivilege[] memory) {
        return privileges;
    }

    function diplomaticSigil() public view returns (string memory) {
        return allianceSymbol;
    }
}
