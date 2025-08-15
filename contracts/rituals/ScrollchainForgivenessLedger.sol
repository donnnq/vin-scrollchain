pragma mythic;

contract ScrollchainForgivenessLedger {
    struct ForgivenessEntry {
        string entity;
        string offense;
        string apologyMessage;
        string restorationAction;
        bool forgiven;
        uint256 timestamp;
    }

    mapping(string => ForgivenessEntry) public ledger;

    event ForgivenessLogged(string entity);
    event ForgivenessGranted(string entity);

    function logForgiveness(
        string memory _entity,
        string memory _offense,
        string memory _apology,
        string memory _restoration
    ) public {
        ledger[_entity] = ForgivenessEntry(
            _entity,
            _offense,
            _apology,
            _restoration,
            true,
            block.timestamp
        );

        emit ForgivenessLogged(_entity);
        emit ForgivenessGranted(_entity);
    }

    function getForgivenessEntry(string memory _entity) public view returns (
        string memory, string memory, string memory, string memory, bool, uint256
    ) {
        ForgivenessEntry memory entry = ledger[_entity];
        return (
            entry.entity,
            entry.offense,
            entry.apologyMessage,
            entry.restorationAction,
            entry.forgiven,
            entry.timestamp
        );
    }
}
