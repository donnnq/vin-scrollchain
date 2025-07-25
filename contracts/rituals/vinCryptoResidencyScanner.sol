// SPDX-License-Identifier: VINVIN-MIGRATIONOPS
pragma mythstream ^2025.07;

contract vinCryptoResidencyScanner {
    address public scrollkeeper;
    string[] public eligibleCountries;
    mapping(string => bool) public acceptsCrypto;
    mapping(string => uint256) public minInvestmentUSD;
    mapping(string => string) public visaType;

    event CountryLogged(string country, bool cryptoOK, uint256 minInvestment, string visaClass);
    event MigrationPing(string country, string vibe);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logCountry(
        string memory name,
        bool cryptoFriendly,
        uint256 minUSD,
        string memory visa
    ) public {
        eligibleCountries.push(name);
        acceptsCrypto[name] = cryptoFriendly;
        minInvestmentUSD[name] = minUSD;
        visaType[name] = visa;
        emit CountryLogged(name, cryptoFriendly, minUSD, visa);
    }

    function pingMigration(string memory country) public {
        require(acceptsCrypto[country] == true, "Country not crypto-enabled.");
        emit MigrationPing(country, "Scrollkeeper passport fusion approved 🟢💼✨");
    }
}
