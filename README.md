# portfolio-optimization
Cryptocurrency portfolio optimization

This repository contains a Jupyter notebook with a cryptocurrency portfolio optimization strategy. Inspired by [Benjamin Cowen](https://intothecryptoverse.com/)'s videos related to maximizing your risk-adjusted returns by solving for the maximum [Sharpe](https://www.investopedia.com/terms/s/sharperatio.asp) [Ratio](https://www.investopedia.com/articles/07/sharpe_ratio.asp). Crunching some historic returns and volatility data to find the portfolio which gives the best expected return for each unit of risk.

---

![Optimised portfolio](screenshot.png)

## Jupyter setup
I'm not really into Python, and not up-to-date with Python tooling and the best way to install everything and use it, and thus prefer to just simply run everything inside Docker containers.    
[Jupyter Docker Stacks](https://github.com/jupyter/docker-stacks) are a bunch of ready-to-run Docker images that contain a ready-made environment to run Jupyter applications.

### Build Jupyter container

```
docker build --rm -t docker-jupyter .
```

### Run Jupyter container

```
docker-compose up
```


## Resources
[Extensible Docker image for Jupyter Notebooks](https://github.com/augusto-herrmann/docker-jupyter-extensible)