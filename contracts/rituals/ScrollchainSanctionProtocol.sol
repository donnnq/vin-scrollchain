pragma mythic;

contract ScrollchainSanctionProtocol {
    struct Sanction {
        string country;
        string reason;
        bool rareEarthExportFrozen;
        bool importExportLocked;
        string unlockCondition;
        string civicMessage;
    }

    Sanction public activeSanction;

    event SanctionActivated(string country, string reason);
    event SanctionLifted(string country);

    function activateSanction(
        string memory _country,
        string memory _reason,
        string memory _condition,
        string memory _message
    ) public {
        activeSanction = Sanction(
            _country,
            _reason,
            true,
            true,
            _condition,
            _message
        );
        emit SanctionActivated(_country, _reason);
    }

    function liftSanction(string memory _country) public {
        require(keccak256(bytes(_country)) == keccak256(bytes(activeSanction.country)), "Invalid country");
        activeSanction.rareEarthExportFrozen = false;
        activeSanction.importExportLocked = false;
        emit SanctionLifted(_country);
    }

    function getSanctionStatus() public view returns (
        string memory, string memory, bool, bool, string memory, string memory
    ) {
        return (
            activeSanction.country,
            activeSanction.reason,
            activeSanction.rareEarthExportFrozen,
            activeSanction.importExportLocked,
            activeSanction.unlockCondition,
            activeSanction.civicMessage
        );
    }
}
