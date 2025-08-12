// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinTariffLiberation - A civic-grade scroll for zero tariff on core imports
/// @author Vinvin
/// @notice This contract encodes the mythic petition to remove all tariffs on strategic imports
/// @dev Deployable on Scrollchain or used as symbolic civic artifact

contract vinTariffLiberation {
    address public scrollsmith;
    string public purpose = "Total Tariff Exemption for Core Imports";
    uint256 public timestamp;
    mapping(string => bool) public exemptedImports;

    event ImportExempted(string category, string example);
    event ScrollSigned(address signer, string blessing);

    constructor() {
        scrollsmith = msg.sender;
        timestamp = block.timestamp;

        // Initial exempted categories
        exemptedImports["Semiconductors"] = true;
        exemptedImports["JapaneseVehicles"] = true;
        exemptedImports["TechModules"] = true;
        exemptedImports["CivicMachinery"] = true;
    }

    function blessImport(string memory category, string memory example) public {
        exemptedImports[category] = true;
        emit ImportExempted(category, example);
    }

    function signScroll(string memory blessing) public {
        emit ScrollSigned(msg.sender, blessing);
    }

    function isExempted(string memory category) public view returns (bool) {
        return exemptedImports[category];
    }
}
