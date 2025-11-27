# Trading Bot

A modular Go-based trading bot designed for backtesting strategies on historical price data. This project features a simulated exchange, a configurable trading strategy, and risk management.

## Features

- **Backtesting Engine:** Test trading strategies against historical data to evaluate their performance.
- **Simulated Exchange:** A simple exchange simulation to execute trades and track equity.
- **SMA Crossover Strategy:** A classic trading strategy based on the crossover of two simple moving averages.
- **Risk Management:** A basic risk manager to determine position sizes.
- **Modular Architecture:** The code is organized into logical packages, making it easy to extend and modify.
- **Data Loading:** Load historical price data from CSV files.
- **Trade Logging:** All executed trades are logged to a CSV file for analysis.
- **Docker Support:** Includes a `Dockerfile` for containerized deployment.
- **Easy to Run:** A `Makefile` provides simple commands to run the bot.

## Architecture

The project is structured into the following packages:

- `cmd/bot`: The main application entry point.
- `internal/backtest`: The backtesting engine.
- `internal/data`: Data loading and processing.
- `internal/exchange`: The simulated exchange.
- `internal/risk`: Risk management.
- `internal/strategy`: Trading strategies.
- `internal/types`: Core data structures.
- `internal/utils`: Utility functions.
- `clean`: Python script for cleaning data.

## Getting Started

### Prerequisites

- Go (1.18 or higher)
- Docker (optional)

### Running the Bot

1.  **Clone the repository:**
    ```shell
    git clone https://github.com/ayo-69/trading-bot.git
    cd trading-bot
    ```

2.  **Set up environment variables:**

    Create a `.env` file in the root of the project and add the following variables:

    ```
    DATA_SRC_FILE=data/BTCUSDT_1m.csv
    TRADES_FILE=trades.csv
    ```

3.  **Run the bot:**
    ```shell
    make run
    ```

    This will run the backtest and generate a `trades.csv` file with the executed trades. The final equity will be printed to the console.

## Configuration

The bot is configured using environment variables:

- `DATA_SRC_FILE`: The path to the CSV file containing historical price data.
- `TRADES_FILE`: The path to the file where the executed trades will be saved.

The trading strategy can be configured in `cmd/bot/main.go`:

```go
strat := strategy.NewSMACrossover(10, 30) // Fast: 10, Slow: 30
```

## Strategy: SMA Crossover

The implemented strategy is a simple moving average (SMA) crossover.

- **Buy Signal:** When the fast SMA crosses above the slow SMA.
- **Sell Signal:** When the fast SMA crosses below the slow SMA.

The periods for the fast and slow SMAs can be configured in `cmd/bot/main.go`.

## Backtesting

The backtesting engine (`internal/backtest/engine.go`) simulates the execution of the trading strategy on historical data. It iterates through each candle in the dataset, generates a signal from the strategy, and executes trades on the simulated exchange.

## Future Improvements

- [ ] Implement more trading strategies (e.g., RSI, Bollinger Bands).
- [ ] Support for live trading with real exchanges.
- [ ] More sophisticated risk management rules.
- [ ] Performance metrics and analysis (e.g., Sharpe ratio, drawdown).
- [ ] Support for more data formats.
- [ ] Web-based UI for visualizing backtest results.
- [ ] Add unit and integration tests